(() => {
  "use strict";

  const REPOSITORY = "https://github.com/wsollers/lra-lean";
  const MAX_DECLARATION_NODES = 450;
  const canvas = document.getElementById("graph");
  const context = canvas.getContext("2d");
  const canvasWrap = document.getElementById("canvas-wrap");
  const detail = document.getElementById("detail");
  const nodeList = document.getElementById("node-list");
  const graphHeading = document.getElementById("graph-heading");
  const graphHelp = document.getElementById("graph-help");
  const graphStatus = document.getElementById("graph-status");
  const breadcrumbs = document.getElementById("breadcrumbs");
  const search = document.getElementById("search");
  const searchResults = document.getElementById("search-results");
  const kindFilter = document.getElementById("kind-filter");
  const statusFilter = document.getElementById("status-filter");
  const colors = {};

  let graphData;
  let declarations = [];
  let declarationById = new Map();
  let dependentsById = new Map();
  let level = "areas";
  let selectedArea = null;
  let selectedModule = null;
  let selectedNode = null;
  let visibleNodes = [];
  let visibleEdges = [];
  let hoveredNode = null;
  let transform = { x: 0, y: 0, scale: 1 };
  let dragging = false;
  let dragStart = null;
  let moved = false;

  function cssColor(name) {
    return getComputedStyle(document.documentElement).getPropertyValue(name).trim();
  }

  function refreshColors() {
    colors.text = cssColor("--text");
    colors.muted = cssColor("--muted");
    colors.border = cssColor("--border");
    colors.accent = cssColor("--accent");
    colors.accentSoft = cssColor("--accent-soft");
    colors.statement = cssColor("--statement");
    colors.proof = cssColor("--proof");
    colors.pending = cssColor("--pending");
    colors.surface = cssColor("--surface");
  }

  function areaOf(node) {
    return node.module.split(".")[1] || "Repository";
  }

  function shortName(value) {
    return value.split(".").at(-1);
  }

  function filteredDeclarations() {
    const kind = kindFilter.value;
    const status = statusFilter.value;
    return declarations.filter(node =>
      (kind === "all" || node.kind === kind) &&
      (status === "all" || node.status === status)
    );
  }

  function uniqueDependencies(node) {
    return new Set([...node.statementDependencies, ...node.proofDependencies]);
  }

  function aggregate(getGroup, members) {
    const memberIds = new Set(members.map(node => node.id));
    const groups = new Map();
    for (const declaration of members) {
      const id = getGroup(declaration);
      const group = groups.get(id) || { id, label: shortName(id), count: 0, checked: 0, pending: 0, declarationIds: [] };
      group.count += 1;
      group[declaration.status] += 1;
      group.declarationIds.push(declaration.id);
      groups.set(id, group);
    }
    const edgeCounts = new Map();
    for (const declaration of members) {
      const source = getGroup(declaration);
      for (const dependency of uniqueDependencies(declaration)) {
        if (!memberIds.has(dependency)) continue;
        const target = getGroup(declarationById.get(dependency));
        if (source === target) continue;
        const key = `${source}\u0000${target}`;
        edgeCounts.set(key, (edgeCounts.get(key) || 0) + 1);
      }
    }
    return {
      nodes: [...groups.values()].sort((a, b) => b.count - a.count || a.id.localeCompare(b.id)),
      edges: [...edgeCounts].map(([key, count]) => {
        const [source, target] = key.split("\u0000");
        return { source, target, count, type: "aggregate" };
      })
    };
  }

  function declarationGraph(moduleName, members) {
    const own = members.filter(node => node.module === moduleName);
    const ids = new Set(own.map(node => node.id));
    for (const node of own) {
      for (const dependency of uniqueDependencies(node)) ids.add(dependency);
      for (const dependent of dependentsById.get(node.id) || []) ids.add(dependent);
    }
    const ordered = [...ids]
      .map(id => declarationById.get(id))
      .filter(Boolean)
      .sort((a, b) => {
        const aOwn = a.module === moduleName ? 0 : 1;
        const bOwn = b.module === moduleName ? 0 : 1;
        return aOwn - bOwn || a.module.localeCompare(b.module) || a.ordinal - b.ordinal;
      })
      .slice(0, MAX_DECLARATION_NODES);
    const visibleIds = new Set(ordered.map(node => node.id));
    const edges = [];
    for (const node of ordered) {
      for (const dependency of node.statementDependencies) {
        if (visibleIds.has(dependency)) edges.push({ source: node.id, target: dependency, count: 1, type: "statement" });
      }
      for (const dependency of node.proofDependencies) {
        if (visibleIds.has(dependency)) edges.push({ source: node.id, target: dependency, count: 1, type: "proof" });
      }
    }
    return { nodes: ordered.map(node => ({ ...node, label: shortName(node.id), count: 1 })), edges, total: ids.size };
  }

  function hash(value) {
    let result = 2166136261;
    for (let index = 0; index < value.length; index += 1) {
      result ^= value.charCodeAt(index);
      result = Math.imul(result, 16777619);
    }
    return result >>> 0;
  }

  function layout(nodes) {
    const width = canvas.clientWidth;
    const height = canvas.clientHeight;
    const centerX = width / 2;
    const centerY = height / 2;
    const count = nodes.length;
    const maxCount = Math.max(1, ...nodes.map(node => node.count || 1));
    const radiusScale = value => maxCount <= 1 ? 5 : 6 + 22 * Math.sqrt((value || 1) / maxCount);
    const rings = Math.max(1, Math.ceil(Math.sqrt(count / 5)));
    return nodes.map((node, index) => {
      const seededIndex = (index + (hash(node.id) % Math.max(1, count))) % Math.max(1, count);
      const angle = seededIndex * 2.399963229728653;
      const ring = Math.min(rings, Math.sqrt(seededIndex + 1));
      const spreadX = Math.max(80, width * .43);
      const spreadY = Math.max(70, height * .40);
      return {
        ...node,
        x: centerX + Math.cos(angle) * spreadX * ring / rings,
        y: centerY + Math.sin(angle) * spreadY * ring / rings,
        radius: radiusScale(node.count)
      };
    });
  }

  function buildView() {
    const members = filteredDeclarations();
    let graph;
    if (level === "areas") {
      graph = aggregate(areaOf, members);
      graphHeading.textContent = "Subject areas";
      graphHelp.textContent = "Select an area to inspect its modules. Drag to pan and use the wheel to zoom.";
    } else if (level === "modules") {
      graph = aggregate(node => node.module, members.filter(node => areaOf(node) === selectedArea));
      graphHeading.textContent = selectedArea;
      graphHelp.textContent = "Select a module to inspect declarations and their direct dependencies.";
    } else {
      graph = declarationGraph(selectedModule, members);
      graphHeading.textContent = shortName(selectedModule);
      graphHelp.textContent = "Statement dependencies are green; proof-body dependencies are orange.";
    }
    visibleNodes = layout(graph.nodes);
    visibleEdges = graph.edges;
    selectedNode = selectedNode && visibleNodes.find(node => node.id === selectedNode.id) || null;
    resetTransform();
    renderBreadcrumbs();
    renderNodeList();
    renderDetail();
    graphStatus.textContent = `${visibleNodes.length.toLocaleString()} nodes · ${visibleEdges.length.toLocaleString()} edges${graph.total > visibleNodes.length ? ` · showing first ${visibleNodes.length.toLocaleString()} of ${graph.total.toLocaleString()} connected declarations` : ""}`;
    draw();
  }

  function renderBreadcrumbs() {
    breadcrumbs.replaceChildren();
    const entries = [{ label: "Areas", target: "areas" }];
    if (selectedArea) entries.push({ label: selectedArea, target: "modules" });
    if (selectedModule) entries.push({ label: shortName(selectedModule), target: "declarations" });
    for (const entry of entries) {
      const button = document.createElement("button");
      button.type = "button";
      button.textContent = entry.label;
      if (entry.target === level) button.setAttribute("aria-current", "page");
      button.addEventListener("click", () => {
        level = entry.target;
        if (entry.target === "areas") { selectedArea = null; selectedModule = null; }
        if (entry.target === "modules") selectedModule = null;
        selectedNode = null;
        buildView();
      });
      breadcrumbs.append(button);
    }
  }

  function renderNodeList() {
    nodeList.replaceChildren();
    const listed = [...visibleNodes].sort((a, b) => (b.count || 1) - (a.count || 1) || a.label.localeCompare(b.label)).slice(0, 80);
    if (!listed.length) {
      const empty = document.createElement("p");
      empty.className = "empty";
      empty.textContent = "No nodes match these filters.";
      nodeList.append(empty);
      return;
    }
    for (const node of listed) {
      const button = document.createElement("button");
      button.type = "button";
      button.textContent = level === "declarations" ? `${node.label} — ${shortName(node.module)}` : `${node.label} — ${node.count.toLocaleString()}`;
      button.setAttribute("aria-pressed", String(selectedNode?.id === node.id));
      button.addEventListener("click", () => selectNode(node));
      nodeList.append(button);
    }
  }

  function renderDetail() {
    if (!selectedNode) {
      detail.innerHTML = "<p>Select a node to inspect it.</p>";
      return;
    }
    const node = selectedNode;
    if (level !== "declarations") {
      detail.innerHTML = `
        <h3>${escapeHtml(node.label)}</h3>
        <dl>
          <dt>Declarations</dt><dd>${node.count.toLocaleString()}</dd>
          <dt>Checked</dt><dd>${node.checked.toLocaleString()}</dd>
          <dt>Pending</dt><dd class="${node.pending ? "status-pending" : ""}">${node.pending.toLocaleString()}</dd>
        </dl>
        <p><button type="button" id="open-selection">Open ${level === "areas" ? "area" : "module"}</button></p>`;
      document.getElementById("open-selection").addEventListener("click", () => openNode(node));
      return;
    }
    const statementCount = node.statementDependencies.length;
    const proofCount = node.proofDependencies.length;
    detail.innerHTML = `
      <h3>${escapeHtml(node.label)}</h3>
      <p class="doc">${escapeHtml(node.doc || "No declaration documentation is available in the compiled environment.")}</p>
      <dl>
        <dt>Kind</dt><dd>${escapeHtml(node.kind)}</dd>
        <dt>Status</dt><dd class="${node.status === "pending" ? "status-pending" : ""}">${escapeHtml(node.status)}</dd>
        <dt>Module</dt><dd>${escapeHtml(node.module)}</dd>
        <dt>Statement deps</dt><dd>${statementCount.toLocaleString()}</dd>
        <dt>Proof deps</dt><dd>${proofCount.toLocaleString()}</dd>
      </dl>
      <p><a href="${REPOSITORY}/blob/main/${encodeURI(node.source)}">View Lean source</a></p>`;
  }

  function escapeHtml(value) {
    return String(value).replace(/[&<>"]/g, character => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;" })[character]);
  }

  function openNode(node) {
    if (level === "areas") {
      selectedArea = node.id;
      selectedModule = null;
      level = "modules";
    } else if (level === "modules") {
      selectedModule = node.id;
      level = "declarations";
    }
    selectedNode = null;
    buildView();
  }

  function selectNode(node) {
    selectedNode = node;
    renderDetail();
    renderNodeList();
    draw();
  }

  function resizeCanvas() {
    const ratio = window.devicePixelRatio || 1;
    const width = canvas.clientWidth;
    const height = canvas.clientHeight;
    canvas.width = Math.round(width * ratio);
    canvas.height = Math.round(height * ratio);
    context.setTransform(ratio, 0, 0, ratio, 0, 0);
    if (visibleNodes.length) {
      visibleNodes = layout(visibleNodes);
      draw();
    }
  }

  function resetTransform() {
    transform = { x: 0, y: 0, scale: 1 };
  }

  function screenPoint(node) {
    return { x: node.x * transform.scale + transform.x, y: node.y * transform.scale + transform.y };
  }

  function drawArrow(from, to, color, width) {
    const dx = to.x - from.x;
    const dy = to.y - from.y;
    const distance = Math.hypot(dx, dy) || 1;
    const targetPadding = (to.radius || 6) * transform.scale + 4;
    const endX = to.x - dx / distance * targetPadding;
    const endY = to.y - dy / distance * targetPadding;
    context.strokeStyle = color;
    context.fillStyle = color;
    context.lineWidth = width;
    context.globalAlpha = .45;
    context.beginPath();
    context.moveTo(from.x, from.y);
    context.lineTo(endX, endY);
    context.stroke();
    const angle = Math.atan2(dy, dx);
    context.beginPath();
    context.moveTo(endX, endY);
    context.lineTo(endX - 7 * Math.cos(angle - .5), endY - 7 * Math.sin(angle - .5));
    context.lineTo(endX - 7 * Math.cos(angle + .5), endY - 7 * Math.sin(angle + .5));
    context.closePath();
    context.fill();
    context.globalAlpha = 1;
  }

  function draw() {
    refreshColors();
    const width = canvas.clientWidth;
    const height = canvas.clientHeight;
    context.clearRect(0, 0, width, height);
    const positions = new Map(visibleNodes.map(node => [node.id, { ...screenPoint(node), radius: node.radius } ]));
    for (const edge of visibleEdges) {
      const from = positions.get(edge.source);
      const to = positions.get(edge.target);
      if (!from || !to) continue;
      const color = edge.type === "proof" ? colors.proof : edge.type === "statement" ? colors.statement : colors.border;
      drawArrow(from, to, color, Math.min(3, .6 + Math.log2(edge.count + 1) * .55));
    }
    const query = search.value.trim().toLowerCase();
    const showAllLabels = visibleNodes.length <= 45;
    for (const node of visibleNodes) {
      const point = screenPoint(node);
      const radius = Math.max(4, node.radius * transform.scale);
      const selected = selectedNode?.id === node.id;
      const hovered = hoveredNode?.id === node.id;
      const matches = query && node.id.toLowerCase().includes(query);
      context.fillStyle = node.status === "pending" ? colors.pending : selected ? colors.accent : colors.accentSoft;
      context.strokeStyle = selected || hovered || matches ? colors.accent : colors.border;
      context.lineWidth = selected || hovered || matches ? 3 : 1;
      context.beginPath();
      context.arc(point.x, point.y, radius, 0, Math.PI * 2);
      context.fill();
      context.stroke();
      if (showAllLabels || selected || hovered || matches) {
        context.fillStyle = colors.text;
        context.font = `${selected ? 600 : 500} 12px system-ui, sans-serif`;
        context.textAlign = "center";
        context.textBaseline = "top";
        const label = node.label.length > 34 ? `${node.label.slice(0, 31)}…` : node.label;
        context.fillText(label, point.x, point.y + radius + 5);
      }
    }
  }

  function nodeAt(clientX, clientY) {
    const bounds = canvas.getBoundingClientRect();
    const x = clientX - bounds.left;
    const y = clientY - bounds.top;
    let best = null;
    let bestDistance = Infinity;
    for (const node of visibleNodes) {
      const point = screenPoint(node);
      const distance = Math.hypot(point.x - x, point.y - y);
      const hitRadius = Math.max(12, node.radius * transform.scale + 5);
      if (distance <= hitRadius && distance < bestDistance) {
        best = node;
        bestDistance = distance;
      }
    }
    return best;
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
      draw();
    } else {
      hoveredNode = nodeAt(event.clientX, event.clientY);
      canvas.style.cursor = hoveredNode ? "pointer" : "grab";
      draw();
    }
  });
  canvas.addEventListener("pointerup", event => {
    dragging = false;
    if (!moved) {
      const node = nodeAt(event.clientX, event.clientY);
      if (node) selectNode(node);
    }
  });
  canvas.addEventListener("dblclick", event => {
    const node = nodeAt(event.clientX, event.clientY);
    if (node && level !== "declarations") openNode(node);
  });
  canvas.addEventListener("wheel", event => {
    event.preventDefault();
    const bounds = canvas.getBoundingClientRect();
    const x = event.clientX - bounds.left;
    const y = event.clientY - bounds.top;
    const previous = transform.scale;
    const next = Math.min(3.5, Math.max(.35, previous * Math.exp(-event.deltaY * .001)));
    transform.x = x - (x - transform.x) * next / previous;
    transform.y = y - (y - transform.y) * next / previous;
    transform.scale = next;
    draw();
  }, { passive: false });

  document.getElementById("controls").addEventListener("submit", event => {
    event.preventDefault();
    const query = search.value.trim().toLowerCase();
    if (!query) return;
    const match = declarations.find(node => node.id.toLowerCase() === query) || declarations.find(node => node.id.toLowerCase().includes(query));
    if (!match) {
      graphStatus.textContent = `No declaration matches “${search.value.trim()}”.`;
      return;
    }
    selectedArea = areaOf(match);
    selectedModule = match.module;
    level = "declarations";
    buildView();
    const visible = visibleNodes.find(node => node.id === match.id);
    if (visible) selectNode(visible);
  });

  search.addEventListener("input", () => {
    const query = search.value.trim().toLowerCase();
    searchResults.replaceChildren();
    if (query.length >= 2) {
      for (const node of declarations.filter(item => item.id.toLowerCase().includes(query)).slice(0, 25)) {
        const option = document.createElement("option");
        option.value = node.id;
        searchResults.append(option);
      }
    }
    draw();
  });
  kindFilter.addEventListener("change", buildView);
  statusFilter.addEventListener("change", buildView);
  document.getElementById("reset-view").addEventListener("click", () => { resetTransform(); draw(); });
  new ResizeObserver(resizeCanvas).observe(canvasWrap);
  matchMedia("(prefers-color-scheme: dark)").addEventListener("change", draw);

  fetch("data.json")
    .then(response => {
      if (!response.ok) throw new Error(`HTTP ${response.status}`);
      return response.json();
    })
    .then(data => {
      graphData = data;
      declarations = data.nodes;
      declarationById = new Map(declarations.map(node => [node.id, node]));
      for (const node of declarations) {
        for (const dependency of uniqueDependencies(node)) {
          const dependents = dependentsById.get(dependency) || [];
          dependents.push(node.id);
          dependentsById.set(dependency, dependents);
        }
      }
      const kinds = [...new Set(declarations.map(node => node.kind))].sort();
      for (const kind of kinds) {
        const option = document.createElement("option");
        option.value = kind;
        option.textContent = kind[0].toUpperCase() + kind.slice(1);
        kindFilter.append(option);
      }
      document.getElementById("summary").textContent = `${data.summary.declarations.toLocaleString()} declarations · ${data.summary.dependencies.toLocaleString()} dependencies · ${data.summary.pending.toLocaleString()} pending`;
      resizeCanvas();
      buildView();
    })
    .catch(error => {
      graphStatus.textContent = `Unable to load proof-map data: ${error.message}`;
      detail.innerHTML = "<p>The compiled graph was not generated. Run the proof-map extractor before building the site.</p>";
    });
})();
