(() => {
  "use strict";

  const REPOSITORY = "https://github.com/wsollers/lra-lean";
  const TAU = Math.PI * 2;
  const GOLDEN = 0.6180339887498949;
  const canvas = document.getElementById("atlas");
  const context = canvas.getContext("2d");
  const canvasWrap = document.getElementById("canvas-wrap");
  const loading = document.getElementById("loading");
  const mapStatus = document.getElementById("map-status");
  const hoverCard = document.getElementById("hover-card");
  const selection = document.getElementById("selection");
  const areaList = document.getElementById("area-list");
  const search = document.getElementById("search");
  const searchResults = document.getElementById("search-results");
  const wheelButton = document.getElementById("wheel-view");
  const treemapButton = document.getElementById("treemap-view");
  const helpButton = document.getElementById("help-button");
  const helpPanel = document.getElementById("help-panel");

  let declarations = [];
  let declarationById = new Map();
  let dependentsById = new Map();
  let areas = [];
  let positionById = new Map();
  let regionRects = [];
  let view = "wheel";
  let selectedNode = null;
  let hoveredNode = null;
  let selectedArea = null;
  let dragging = false;
  let moved = false;
  let dragStart = null;
  let transform = { x: 0, y: 0, scale: 1 };
  let viewCenter = { x: 0, y: 0 };
  let viewBounds = { x: -510, y: -510, width: 1020, height: 1020 };
  let didInitialFit = false;
  const colors = {};

  function cssColor(name) {
    return getComputedStyle(document.documentElement).getPropertyValue(name).trim();
  }

  function refreshColors() {
    for (const name of ["bg", "surface", "surface-raised", "surface-soft", "text", "muted", "border", "strong-border", "ink", "accent", "theorem", "definition", "structure", "axiom", "pending", "statement", "proof"]) {
      colors[name] = cssColor(`--${name}`);
    }
    colors.areas = Array.from({ length: 8 }, (_, index) => cssColor(`--area-${index + 1}`));
  }

  function hash(value) {
    let result = 2166136261;
    for (let index = 0; index < value.length; index += 1) {
      result ^= value.charCodeAt(index);
      result = Math.imul(result, 16777619);
    }
    return result >>> 0;
  }

  function fraction(value) {
    return value - Math.floor(value);
  }

  function areaOf(node) {
    return node.module.split(".")[1] || "Repository";
  }

  function shortName(value) {
    return value.split(".").at(-1);
  }

  function displayName(value) {
    return value.replace(/([a-z0-9])([A-Z])/g, "$1 $2").replace(/_/g, " ");
  }

  function compactNumber(value) {
    if (value >= 1_000_000) return `${(value / 1_000_000).toFixed(value >= 10_000_000 ? 1 : 2)}M`;
    if (value >= 1_000) return `${(value / 1_000).toFixed(value >= 10_000 ? 1 : 2)}k`;
    return value.toLocaleString();
  }

  function escapeHtml(value) {
    return String(value).replace(/[&<>\"]/g, character => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '\"': "&quot;" })[character]);
  }

  function uniqueDependencies(node) {
    return new Set([...node.statementDependencies, ...node.proofDependencies]);
  }

  function buildHierarchy() {
    const areaMap = new Map();
    for (const node of declarations) {
      const areaId = areaOf(node);
      let area = areaMap.get(areaId);
      if (!area) {
        area = { id: areaId, label: displayName(areaId), nodes: [], moduleMap: new Map(), color: "" };
        areaMap.set(areaId, area);
      }
      area.nodes.push(node);
      let module = area.moduleMap.get(node.module);
      if (!module) {
        module = { id: node.module, label: displayName(shortName(node.module)), nodes: [] };
        area.moduleMap.set(node.module, module);
      }
      module.nodes.push(node);
    }
    areas = [...areaMap.values()].sort((a, b) => b.nodes.length - a.nodes.length || a.id.localeCompare(b.id));
    areas.forEach((area, index) => {
      area.modules = [...area.moduleMap.values()].sort((a, b) => b.nodes.length - a.nodes.length || a.id.localeCompare(b.id));
      area.color = colors.areas[index % colors.areas.length];
      area.pending = area.nodes.reduce((count, node) => count + (node.status === "pending"), 0);
    });
  }

  function kindGroup(node) {
    if (node.kind === "theorem") return "theorem";
    if (node.kind === "definition") return "definition";
    if (node.kind === "axiom" || node.kind === "inductive" || node.kind === "quotient") return "axiom";
    return "structure";
  }

  function setWheelLayout() {
    positionById = new Map();
    regionRects = [];
    viewCenter = { x: 0, y: 0 };
    viewBounds = { x: -525, y: -525, width: 1050, height: 1050 };
    const innerRadius = 92;
    const outerRadius = 404;
    const areaGap = 0.012;
    const weights = areas.map(area => Math.sqrt(area.nodes.length));
    const totalWeight = weights.reduce((sum, weight) => sum + weight, 0);
    let cursor = -Math.PI / 2;

    areas.forEach((area, areaIndex) => {
      const span = (TAU - areaGap * areas.length) * weights[areaIndex] / totalWeight;
      area.startAngle = cursor + areaGap / 2;
      area.endAngle = cursor + span - areaGap / 2;
      cursor += span + areaGap;

      const moduleWeights = area.modules.map(module => Math.sqrt(module.nodes.length));
      const moduleTotal = moduleWeights.reduce((sum, weight) => sum + weight, 0);
      let moduleCursor = area.startAngle;
      area.modules.forEach((module, moduleIndex) => {
        const moduleSpan = (area.endAngle - area.startAngle) * moduleWeights[moduleIndex] / moduleTotal;
        module.startAngle = moduleCursor;
        module.endAngle = moduleCursor + moduleSpan;
        moduleCursor += moduleSpan;
        const usableSpan = Math.max(0.002, moduleSpan - 0.003);
        const seed = (hash(module.id) % 10_000) / 10_000;
        module.nodes
          .slice()
          .sort((a, b) => a.ordinal - b.ordinal || a.id.localeCompare(b.id))
          .forEach((node, index) => {
            const angleUnit = fraction(seed + index * GOLDEN);
            const radiusUnit = fraction(seed * 0.73 + index * GOLDEN * GOLDEN);
            const angle = module.startAngle + 0.0015 + angleUnit * usableSpan;
            const radius = Math.sqrt(innerRadius ** 2 + radiusUnit * (outerRadius ** 2 - innerRadius ** 2));
            positionById.set(node.id, { x: Math.cos(angle) * radius, y: Math.sin(angle) * radius, node, area, module });
          });
      });
    });
  }

  function splitWeighted(items, rect, vertical, result) {
    if (!items.length) return;
    if (items.length === 1) {
      result.push({ item: items[0], ...rect });
      return;
    }
    const total = items.reduce((sum, item) => sum + item.weight, 0);
    let running = 0;
    let splitIndex = 1;
    for (; splitIndex < items.length; splitIndex += 1) {
      running += items[splitIndex - 1].weight;
      if (running >= total / 2) break;
    }
    const first = items.slice(0, splitIndex);
    const second = items.slice(splitIndex);
    const firstWeight = first.reduce((sum, item) => sum + item.weight, 0);
    const ratio = firstWeight / total;
    if (vertical) {
      splitWeighted(first, { x: rect.x, y: rect.y, width: rect.width * ratio, height: rect.height }, !vertical, result);
      splitWeighted(second, { x: rect.x + rect.width * ratio, y: rect.y, width: rect.width * (1 - ratio), height: rect.height }, !vertical, result);
    } else {
      splitWeighted(first, { x: rect.x, y: rect.y, width: rect.width, height: rect.height * ratio }, !vertical, result);
      splitWeighted(second, { x: rect.x, y: rect.y + rect.height * ratio, width: rect.width, height: rect.height * (1 - ratio) }, !vertical, result);
    }
  }

  function setTreemapLayout() {
    positionById = new Map();
    regionRects = [];
    viewCenter = { x: 500, y: 385 };
    viewBounds = { x: -20, y: -20, width: 1040, height: 810 };
    const areaRects = [];
    splitWeighted(areas.map(area => ({ item: area, weight: area.nodes.length })), { x: 0, y: 0, width: 1000, height: 770 }, true, areaRects);
    for (const areaRect of areaRects) {
      const area = areaRect.item.item;
      const inset = 4;
      const header = Math.min(24, areaRect.height * 0.12);
      regionRects.push({ type: "area", area, x: areaRect.x, y: areaRect.y, width: areaRect.width, height: areaRect.height });
      const moduleRects = [];
      splitWeighted(
        area.modules.map(module => ({ item: module, weight: module.nodes.length })),
        { x: areaRect.x + inset, y: areaRect.y + header, width: Math.max(0, areaRect.width - inset * 2), height: Math.max(0, areaRect.height - header - inset) },
        areaRect.width > areaRect.height,
        moduleRects
      );
      for (const moduleRect of moduleRects) {
        const module = moduleRect.item.item;
        regionRects.push({ type: "module", area, module, x: moduleRect.x, y: moduleRect.y, width: moduleRect.width, height: moduleRect.height });
        const padding = 4;
        const labelSpace = moduleRect.height > 42 && moduleRect.width > 58 ? 16 : 2;
        const usableWidth = Math.max(1, moduleRect.width - padding * 2);
        const usableHeight = Math.max(1, moduleRect.height - padding * 2 - labelSpace);
        const columns = Math.max(1, Math.ceil(Math.sqrt(module.nodes.length * usableWidth / usableHeight)));
        const rows = Math.max(1, Math.ceil(module.nodes.length / columns));
        module.nodes.forEach((node, index) => {
          const column = index % columns;
          const row = Math.floor(index / columns);
          const jitter = (hash(node.id) % 101) / 101 - 0.5;
          const x = moduleRect.x + padding + (column + 0.5 + jitter * 0.25) * usableWidth / columns;
          const y = moduleRect.y + padding + labelSpace + (row + 0.5 + jitter * 0.2) * usableHeight / rows;
          positionById.set(node.id, { x, y, node, area, module });
        });
      }
    }
  }

  function setLayout() {
    if (view === "wheel") setWheelLayout();
    else setTreemapLayout();
    fitView();
    updateStatus();
    draw();
  }

  function fitView() {
    const width = canvas.clientWidth || 1000;
    const height = canvas.clientHeight || 760;
    const margin = view === "wheel" ? 36 : 26;
    transform.scale = Math.min((width - margin * 2) / viewBounds.width, (height - margin * 2) / viewBounds.height);
    transform.x = 0;
    transform.y = 0;
    didInitialFit = true;
  }

  function focusArea(area) {
    if (!area) { fitView(); draw(); return; }
    const points = area.nodes.map(node => positionById.get(node.id)).filter(Boolean);
    if (!points.length) return;
    const xs = points.map(point => point.x);
    const ys = points.map(point => point.y);
    const minX = Math.min(...xs), maxX = Math.max(...xs), minY = Math.min(...ys), maxY = Math.max(...ys);
    const bounds = { x: minX - 35, y: minY - 35, width: Math.max(90, maxX - minX + 70), height: Math.max(90, maxY - minY + 70) };
    const width = canvas.clientWidth;
    const height = canvas.clientHeight;
    transform.scale = Math.min((width - 80) / bounds.width, (height - 80) / bounds.height, 4);
    const targetX = bounds.x + bounds.width / 2;
    const targetY = bounds.y + bounds.height / 2;
    transform.x = -(targetX - viewCenter.x) * transform.scale;
    transform.y = -(targetY - viewCenter.y) * transform.scale;
    draw();
  }

  function worldToScreen(point) {
    return {
      x: (point.x - viewCenter.x) * transform.scale + canvas.clientWidth / 2 + transform.x,
      y: (point.y - viewCenter.y) * transform.scale + canvas.clientHeight / 2 + transform.y
    };
  }

  function screenToWorld(x, y) {
    return {
      x: (x - canvas.clientWidth / 2 - transform.x) / transform.scale + viewCenter.x,
      y: (y - canvas.clientHeight / 2 - transform.y) / transform.scale + viewCenter.y
    };
  }

  function drawArcBand(area, inner, outer) {
    context.beginPath();
    context.arc(0, 0, outer, area.startAngle, area.endAngle);
    context.arc(0, 0, inner, area.endAngle, area.startAngle, true);
    context.closePath();
    context.fillStyle = area.color;
    context.fill();
  }

  function withWorldTransform(callback) {
    context.save();
    context.translate(canvas.clientWidth / 2 + transform.x, canvas.clientHeight / 2 + transform.y);
    context.scale(transform.scale, transform.scale);
    context.translate(-viewCenter.x, -viewCenter.y);
    callback();
    context.restore();
  }

  function drawWheelStructure() {
    for (const area of areas) {
      context.globalAlpha = selectedArea && selectedArea !== area.id ? 0.24 : 1;
      drawArcBand(area, 415, 451);
      context.strokeStyle = colors.bg;
      context.lineWidth = 4 / transform.scale;
      context.stroke();
      for (const module of area.modules) {
        context.beginPath();
        context.moveTo(Math.cos(module.startAngle) * 88, Math.sin(module.startAngle) * 88);
        context.lineTo(Math.cos(module.startAngle) * 406, Math.sin(module.startAngle) * 406);
        context.strokeStyle = colors.border;
        context.lineWidth = 0.7 / transform.scale;
        context.stroke();
      }
      context.globalAlpha = 1;
    }

    context.beginPath();
    context.arc(0, 0, 72, 0, TAU);
    context.fillStyle = colors.surface;
    context.fill();
    context.strokeStyle = colors.border;
    context.lineWidth = 2 / transform.scale;
    context.stroke();
    context.beginPath();
    context.arc(0, 0, 38, 0, TAU);
    context.strokeStyle = colors.pending;
    context.lineWidth = 3 / transform.scale;
    context.stroke();
    context.beginPath();
    context.arc(0, 0, 12, 0, TAU);
    context.fillStyle = colors.ink;
    context.fill();
    context.beginPath();
    context.arc(0, 0, 4, 0, TAU);
    context.fillStyle = colors.pending;
    context.fill();
    context.fillStyle = colors.text;
    context.font = "600 13px ui-serif, Georgia, serif";
    context.textAlign = "center";
    context.textBaseline = "top";
    context.fillText("LRA", 0, 47);
  }

  function drawTreemapStructure() {
    for (const region of regionRects) {
      if (region.type === "area") {
        context.globalAlpha = selectedArea && selectedArea !== region.area.id ? 0.24 : 1;
        context.fillStyle = region.area.color;
        context.fillRect(region.x, region.y, region.width, region.height);
        context.strokeStyle = colors.strongBorder;
        context.lineWidth = 1.2 / transform.scale;
        context.strokeRect(region.x, region.y, region.width, region.height);
        if (region.width * transform.scale > 70 && region.height * transform.scale > 35) {
          context.fillStyle = colors.text;
          context.font = "600 11px system-ui, sans-serif";
          context.textAlign = "left";
          context.textBaseline = "top";
          context.fillText(region.area.label, region.x + 6, region.y + 5, Math.max(0, region.width - 12));
        }
        context.globalAlpha = 1;
      } else {
        context.strokeStyle = colors.border;
        context.lineWidth = 0.6 / transform.scale;
        context.strokeRect(region.x, region.y, region.width, region.height);
        if (region.width * transform.scale > 92 && region.height * transform.scale > 50) {
          context.fillStyle = colors.muted;
          context.font = "500 9px system-ui, sans-serif";
          context.textAlign = "left";
          context.textBaseline = "top";
          context.fillText(region.module.label, region.x + 5, region.y + 20, Math.max(0, region.width - 10));
        }
      }
    }
  }

  function drawDependencyLines() {
    if (!selectedNode) return;
    const source = positionById.get(selectedNode.id);
    if (!source) return;
    const sourcePoint = source;
    const drawSet = (dependencies, color) => {
      context.strokeStyle = color;
      context.lineWidth = 1.35 / transform.scale;
      for (const id of dependencies) {
        const target = positionById.get(id);
        if (!target) continue;
        context.beginPath();
        context.moveTo(sourcePoint.x, sourcePoint.y);
        if (view === "wheel") {
          const curve = 0.18;
          context.quadraticCurveTo((sourcePoint.x + target.x) * curve, (sourcePoint.y + target.y) * curve, target.x, target.y);
        } else {
          context.lineTo(target.x, target.y);
        }
        context.stroke();
      }
    };
    context.globalAlpha = 0.68;
    drawSet(selectedNode.statementDependencies, colors.statement);
    drawSet(selectedNode.proofDependencies, colors.proof);
    context.globalAlpha = 1;
  }

  function drawNodeMark(point) {
    const node = point.node;
    const selected = selectedNode?.id === node.id;
    const hovered = hoveredNode?.id === node.id;
    const areaDimmed = selectedArea && selectedArea !== point.area.id;
    const dependency = selectedNode && uniqueDependencies(selectedNode).has(node.id);
    const dependent = selectedNode && (dependentsById.get(selectedNode.id) || []).includes(node.id);
    let radius = node.status === "pending" ? 3.8 : 2.2;
    if (selected || hovered) radius = 6.3;
    else if (dependency || dependent) radius = 4.2;
    const group = kindGroup(node);
    const fill = node.status === "pending" ? colors.pending : colors[group];
    context.globalAlpha = areaDimmed ? 0.12 : selectedNode && !selected && !dependency && !dependent ? 0.34 : 0.92;
    context.fillStyle = fill;
    context.strokeStyle = selected || hovered ? colors.ink : colors.surface;
    context.lineWidth = (selected || hovered ? 1.8 : 0.75) / transform.scale;
    context.beginPath();
    if (node.status === "pending" || group === "structure") {
      context.moveTo(point.x, point.y - radius);
      context.lineTo(point.x + radius, point.y);
      context.lineTo(point.x, point.y + radius);
      context.lineTo(point.x - radius, point.y);
      context.closePath();
    } else if (group === "definition") {
      context.rect(point.x - radius, point.y - radius, radius * 2, radius * 2);
    } else if (group === "axiom") {
      context.arc(point.x, point.y, radius, 0, TAU);
      context.moveTo(point.x, point.y);
      context.lineTo(point.x + radius, point.y + radius);
    } else {
      context.arc(point.x, point.y, radius, 0, TAU);
    }
    context.fill();
    context.stroke();
    context.globalAlpha = 1;
  }

  function drawWheelLabels() {
    const drawLabel = (label, angle) => {
      const x = Math.cos(angle) * 474;
      const y = Math.sin(angle) * 474;
      context.save();
      context.translate(x, y);
      let rotation = angle + Math.PI / 2;
      if (Math.cos(angle) < 0) rotation += Math.PI;
      context.rotate(rotation);
      context.fillStyle = colors.text;
      context.font = "500 11px system-ui, sans-serif";
      context.textAlign = "center";
      context.textBaseline = "middle";
      context.fillText(label, 0, 0);
      context.restore();
    };
    context.save();
    context.translate(canvas.clientWidth / 2 + transform.x, canvas.clientHeight / 2 + transform.y);
    context.scale(transform.scale, transform.scale);
    const smaller = [];
    for (const area of areas) {
      if (selectedArea && selectedArea !== area.id) continue;
      const angle = (area.startAngle + area.endAngle) / 2;
      if (!selectedArea && (area.endAngle - area.startAngle) * 474 * transform.scale < 52) {
        smaller.push(area);
        continue;
      }
      const label = area.label.length > 24 ? `${area.label.slice(0, 22)}…` : area.label;
      drawLabel(label, angle);
    }
    if (smaller.length) {
      const angle = (smaller[0].startAngle + smaller.at(-1).endAngle) / 2;
      drawLabel(`${smaller.length} smaller areas`, angle);
    }
    context.restore();
  }

  function draw() {
    refreshColors();
    const width = canvas.clientWidth;
    const height = canvas.clientHeight;
    context.clearRect(0, 0, width, height);
    context.fillStyle = colors.bg;
    context.fillRect(0, 0, width, height);
    withWorldTransform(() => {
      if (view === "wheel") drawWheelStructure();
      else drawTreemapStructure();
      drawDependencyLines();
      for (const point of positionById.values()) drawNodeMark(point);
    });
    if (view === "wheel") drawWheelLabels();
  }

  function nodeAt(clientX, clientY) {
    const bounds = canvas.getBoundingClientRect();
    const world = screenToWorld(clientX - bounds.left, clientY - bounds.top);
    let best = null;
    let bestDistance = Infinity;
    const hitRadius = Math.max(5, 9 / transform.scale);
    for (const point of positionById.values()) {
      const distance = Math.hypot(point.x - world.x, point.y - world.y);
      if (distance < hitRadius && distance < bestDistance) {
        best = point.node;
        bestDistance = distance;
      }
    }
    return best;
  }

  function areaAt(clientX, clientY) {
    const bounds = canvas.getBoundingClientRect();
    const world = screenToWorld(clientX - bounds.left, clientY - bounds.top);
    if (view === "wheel") {
      const radius = Math.hypot(world.x, world.y);
      if (radius < 405 || radius > 460) return null;
      let angle = Math.atan2(world.y, world.x);
      if (angle < -Math.PI / 2) angle += TAU;
      return areas.find(area => angle >= area.startAngle && angle <= area.endAngle) || null;
    }
    const region = regionRects.find(item => item.type === "area" && world.x >= item.x && world.x <= item.x + item.width && world.y >= item.y && world.y <= item.y + item.height);
    return region?.area || null;
  }

  function renderAreaList() {
    areaList.replaceChildren();
    document.getElementById("area-count").textContent = `${areas.length} areas`;
    for (const area of areas) {
      const button = document.createElement("button");
      button.type = "button";
      button.style.setProperty("--area-color", area.color);
      button.setAttribute("aria-pressed", String(selectedArea === area.id));
      button.innerHTML = `<i aria-hidden="true"></i><span>${escapeHtml(area.label)}</span><small>${area.nodes.length.toLocaleString()}</small>`;
      button.addEventListener("click", () => {
        selectedArea = selectedArea === area.id ? null : area.id;
        selectedNode = null;
        renderAreaList();
        renderSelection();
        if (selectedArea) focusArea(area);
        else { fitView(); draw(); }
      });
      areaList.append(button);
    }
  }

  function dependencyButtons(node) {
    const ids = [...uniqueDependencies(node)].slice(0, 8);
    if (!ids.length) return "";
    return `<div class="dependency-chips">${ids.map(id => `<button type="button" data-declaration="${escapeHtml(id)}">${escapeHtml(shortName(id))}</button>`).join("")}</div>`;
  }

  function renderSelection() {
    if (selectedNode) {
      const node = selectedNode;
      selection.innerHTML = `
        <p class="selection-kicker">${escapeHtml(displayName(node.kind))} · ${node.status === "pending" ? "proof pending" : "checked"}</p>
        <h2>${escapeHtml(shortName(node.id))}</h2>
        <p>${escapeHtml(node.doc || "No declaration documentation is available in the compiled environment.")}</p>
        <dl>
          <dt>Area</dt><dd>${escapeHtml(displayName(areaOf(node)))}</dd>
          <dt>Module</dt><dd>${escapeHtml(node.module)}</dd>
          <dt>Statement deps</dt><dd>${node.statementDependencies.length.toLocaleString()}</dd>
          <dt>Proof deps</dt><dd>${node.proofDependencies.length.toLocaleString()}</dd>
          <dt>Dependents</dt><dd>${(dependentsById.get(node.id) || []).length.toLocaleString()}</dd>
        </dl>
        <a href="${REPOSITORY}/blob/main/${encodeURI(node.source)}">View Lean source ↗</a>
        ${dependencyButtons(node)}`;
      selection.querySelectorAll("[data-declaration]").forEach(button => button.addEventListener("click", () => selectDeclaration(button.dataset.declaration, true)));
      return;
    }
    if (selectedArea) {
      const area = areas.find(item => item.id === selectedArea);
      selection.innerHTML = `
        <p class="selection-kicker">Subject area</p>
        <h2>${escapeHtml(area.label)}</h2>
        <p>${area.nodes.length.toLocaleString()} compiled declarations across ${area.modules.length.toLocaleString()} Lean modules.</p>
        <dl><dt>Checked</dt><dd>${(area.nodes.length - area.pending).toLocaleString()}</dd><dt>Pending</dt><dd>${area.pending.toLocaleString()}</dd></dl>`;
      return;
    }
    selection.innerHTML = `<p class="selection-kicker">Selection</p><h2>Learning Real Analysis</h2><p>Select a mark to inspect its statement, status, source, and direct dependencies.</p>`;
  }

  function selectDeclaration(id, focus) {
    const node = declarationById.get(id);
    if (!node) return;
    selectedNode = node;
    selectedArea = areaOf(node);
    renderSelection();
    renderAreaList();
    if (focus) {
      const point = positionById.get(node.id);
      if (point) {
        const width = canvas.clientWidth;
        const height = canvas.clientHeight;
        transform.scale = Math.max(transform.scale, view === "wheel" ? 1.45 : 1.1);
        transform.x = -(point.x - viewCenter.x) * transform.scale;
        transform.y = -(point.y - viewCenter.y) * transform.scale;
        if (width < 500) transform.y += height * 0.08;
      }
    }
    draw();
    updateStatus();
  }

  function showHover(node, clientX, clientY) {
    if (!node) {
      hoverCard.hidden = true;
      return;
    }
    const bounds = canvasWrap.getBoundingClientRect();
    hoverCard.innerHTML = `<strong>${escapeHtml(shortName(node.id))}</strong><span>${escapeHtml(displayName(node.kind))} · ${escapeHtml(displayName(areaOf(node)))}${node.status === "pending" ? " · proof pending" : ""}</span>`;
    hoverCard.hidden = false;
    const left = Math.min(bounds.width - 315, Math.max(8, clientX - bounds.left + 14));
    const top = Math.min(bounds.height - 80, Math.max(8, clientY - bounds.top + 14));
    hoverCard.style.left = `${left}px`;
    hoverCard.style.top = `${top}px`;
  }

  function updateStatus() {
    const layout = view === "wheel" ? "corpus wheel" : "treemap";
    const suffix = selectedNode ? ` · showing ${uniqueDependencies(selectedNode).size.toLocaleString()} direct dependencies` : selectedArea ? ` · ${displayName(selectedArea)} highlighted` : "";
    mapStatus.textContent = `${declarations.length.toLocaleString()} declarations in ${areas.length.toLocaleString()} areas · ${layout}${suffix}`;
  }

  function zoomAt(factor, x, y) {
    const oldScale = transform.scale;
    const newScale = Math.min(8, Math.max(0.2, oldScale * factor));
    const world = screenToWorld(x, y);
    transform.scale = newScale;
    transform.x = x - canvas.clientWidth / 2 - (world.x - viewCenter.x) * newScale;
    transform.y = y - canvas.clientHeight / 2 - (world.y - viewCenter.y) * newScale;
    draw();
  }

  function resizeCanvas() {
    const ratio = window.devicePixelRatio || 1;
    const width = canvas.clientWidth;
    const height = canvas.clientHeight;
    canvas.width = Math.round(width * ratio);
    canvas.height = Math.round(height * ratio);
    context.setTransform(ratio, 0, 0, ratio, 0, 0);
    if (declarations.length) {
      if (!didInitialFit) fitView();
      draw();
    }
  }

  canvas.addEventListener("pointerdown", event => {
    canvas.setPointerCapture(event.pointerId);
    dragging = true;
    moved = false;
    dragStart = { x: event.clientX, y: event.clientY, originX: transform.x, originY: transform.y };
  });
  canvas.addEventListener("pointermove", event => {
    if (dragging) {
      const dx = event.clientX - dragStart.x;
      const dy = event.clientY - dragStart.y;
      if (Math.abs(dx) + Math.abs(dy) > 4) moved = true;
      transform.x = dragStart.originX + dx;
      transform.y = dragStart.originY + dy;
      hoverCard.hidden = true;
      draw();
      return;
    }
    hoveredNode = nodeAt(event.clientX, event.clientY);
    showHover(hoveredNode, event.clientX, event.clientY);
    canvas.style.cursor = hoveredNode ? "pointer" : areaAt(event.clientX, event.clientY) ? "pointer" : "grab";
    draw();
  });
  canvas.addEventListener("pointerleave", () => {
    hoveredNode = null;
    hoverCard.hidden = true;
    draw();
  });
  canvas.addEventListener("pointerup", event => {
    dragging = false;
    if (moved) return;
    const node = nodeAt(event.clientX, event.clientY);
    if (node) {
      selectDeclaration(node.id, false);
      return;
    }
    const area = areaAt(event.clientX, event.clientY);
    if (area) {
      selectedArea = selectedArea === area.id ? null : area.id;
      selectedNode = null;
      renderAreaList();
      renderSelection();
      if (selectedArea) focusArea(area);
      else { fitView(); draw(); }
      updateStatus();
    }
  });
  canvas.addEventListener("wheel", event => {
    event.preventDefault();
    const bounds = canvas.getBoundingClientRect();
    zoomAt(Math.exp(-event.deltaY * 0.001), event.clientX - bounds.left, event.clientY - bounds.top);
  }, { passive: false });

  function setView(nextView) {
    if (view === nextView) return;
    view = nextView;
    wheelButton.setAttribute("aria-pressed", String(view === "wheel"));
    treemapButton.setAttribute("aria-pressed", String(view === "treemap"));
    selectedNode = null;
    selectedArea = null;
    renderSelection();
    renderAreaList();
    setLayout();
  }

  wheelButton.addEventListener("click", () => setView("wheel"));
  treemapButton.addEventListener("click", () => setView("treemap"));
  helpButton.addEventListener("click", () => {
    const open = helpPanel.hidden;
    helpPanel.hidden = !open;
    helpButton.setAttribute("aria-expanded", String(open));
  });
  document.getElementById("zoom-in").addEventListener("click", () => zoomAt(1.35, canvas.clientWidth / 2, canvas.clientHeight / 2));
  document.getElementById("zoom-out").addEventListener("click", () => zoomAt(1 / 1.35, canvas.clientWidth / 2, canvas.clientHeight / 2));
  document.getElementById("zoom-fit").addEventListener("click", () => { selectedArea = null; fitView(); renderAreaList(); draw(); updateStatus(); });

  function runSearch() {
    const query = search.value.trim().toLowerCase();
    if (!query) return;
    const exact = declarationById.get(search.value.trim());
    const match = exact || declarations.find(node => node.id.toLowerCase() === query) || declarations.find(node => node.id.toLowerCase().includes(query));
    if (match) {
      selectDeclaration(match.id, true);
      return;
    }
    const area = areas.find(item => item.id.toLowerCase() === query || item.label.toLowerCase().includes(query));
    if (area) {
      selectedArea = area.id;
      selectedNode = null;
      renderAreaList();
      renderSelection();
      focusArea(area);
      updateStatus();
      return;
    }
    mapStatus.textContent = `No declaration, module, or area matches “${search.value.trim()}”.`;
  }

  search.addEventListener("keydown", event => {
    if (event.key === "Enter") { event.preventDefault(); runSearch(); }
  });
  search.addEventListener("change", runSearch);
  search.addEventListener("input", () => {
    const query = search.value.trim().toLowerCase();
    searchResults.replaceChildren();
    if (query.length < 2) return;
    for (const node of declarations.filter(item => item.id.toLowerCase().includes(query)).slice(0, 30)) {
      const option = document.createElement("option");
      option.value = node.id;
      searchResults.append(option);
    }
  });

  new ResizeObserver(() => {
    didInitialFit = false;
    resizeCanvas();
  }).observe(canvasWrap);
  matchMedia("(prefers-color-scheme: dark)").addEventListener("change", () => {
    refreshColors();
    buildHierarchy();
    renderAreaList();
    setLayout();
  });

  refreshColors();
  fetch("data.json")
    .then(response => {
      if (!response.ok) throw new Error(`HTTP ${response.status}`);
      return response.json();
    })
    .then(data => {
      declarations = data.nodes;
      declarationById = new Map(declarations.map(node => [node.id, node]));
      for (const node of declarations) {
        for (const dependency of uniqueDependencies(node)) {
          const dependents = dependentsById.get(dependency) || [];
          dependents.push(node.id);
          dependentsById.set(dependency, dependents);
        }
      }
      buildHierarchy();
      const metricValues = document.querySelectorAll("#metrics strong");
      metricValues[0].textContent = compactNumber(data.summary.declarations);
      metricValues[1].textContent = compactNumber(data.summary.dependencies);
      metricValues[2].textContent = compactNumber(data.summary.pending);
      renderAreaList();
      renderSelection();
      resizeCanvas();
      setLayout();
      loading.hidden = true;
    })
    .catch(error => {
      loading.textContent = `Unable to load proof-map data: ${error.message}`;
      mapStatus.textContent = "Run the proof-map extractor before building the site.";
    });
})();
