This is a sentence.
>this is a quote
# This is a heading
## This is a second heading 
### This is a third heading


ctrl p = search

> [!NOTE]
> This is a callout

Here is some code `var sin = SinOsc.ar`
```js
var sin = SinOsc.ar
```


# Context
We are making a single page web app to access on a phone. The app is a way to see a variety of online sources and mods that can be used with Minecraft Java Edition to find how to make mob farms and other similar structures. It will have a variety of information and tools that can be used for building and mob farms, as well as spawning rates and conditions. It needs to be designed for new players.

## Prompt 
Make a web app which is styled to look similar to the Minecraft Java Edition user interface, with a similar font and size, appropriate for a smartphone. It is to have the same colors with a light and dark mode toggle at the top of the page. Have many pictures with information. Do not use external libraries.

### Code
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crafter's Guide: Mob Farms</title>
    <style>
        /* --- CORE VARIABLES --- */
        :root {
            /* Default (Dark/Night Mode) - Classic GUI Grey */
            --bg-color: #121212;
            --panel-color: #3b3b3b; /* Bedrock/Deepslate feel */
            --text-color: #e0e0e0;
            --accent-color: #727272;
            
            --btn-face: #989898; /* Classic button grey */
            --btn-shadow: #3f3f3f;
            --btn-highlight: #ffffff;
            --btn-text: #000000;
            
            --slot-bg: #222222;
            --border-light: #ffffff;
            --border-dark: #202020;
            
            --title-color: #fcfc00; /* Classic Minecraft Gold */
            --link-color: #55FFFF;
        }

        /* Light (Day Mode) - Dirt/Menu Style */
        body.light-mode {
            --bg-color: #4a3424; /* Dirt background */
            --panel-color: #c6c6c6; /* Classic Menu Grey */
            --text-color: #202020;
            --accent-color: #a0a0a0;
            
            --btn-face: #d6d6d6;
            --btn-shadow: #555555;
            --btn-highlight: #ffffff;
            --btn-text: #000000;
            
            --slot-bg: #8b8b8b;
            --border-light: #ffffff;
            --border-dark: #373737;
            
            --title-color: #404040;
            --link-color: #0000AA;
        }

        /* --- GLOBAL RESETS --- */
        * {
            box-sizing: border-box;
            -webkit-tap-highlight-color: transparent;
        }

        body {
            font-family: 'Courier New', Courier, monospace; /* Web-safe monospaced */
            font-weight: bold;
            background-color: var(--bg-color);
            background-image: 
                linear-gradient(rgba(0,0,0,0.1) 1px, transparent 1px),
                linear-gradient(90deg, rgba(0,0,0,0.1) 1px, transparent 1px);
            background-size: 20px 20px;
            color: var(--text-color);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
        }

        /* --- CONTAINER --- */
        #app-container {
            width: 100%;
            max-width: 600px; /* Phone constrained */
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            background-color: var(--bg-color);
        }

        /* --- HEADER --- */
        header {
            background-color: var(--panel-color);
            border-bottom: 4px solid var(--border-dark);
            padding: 15px;
            text-align: center;
            position: sticky;
            top: 0;
            z-index: 100;
            box-shadow: 0 4px 10px rgba(0,0,0,0.5);
        }

        h1 {
            font-size: 24px;
            margin: 0 0 10px 0;
            color: var(--title-color);
            text-shadow: 2px 2px 0px #000000;
            letter-spacing: -1px;
        }

        /* --- MC STYLE BUTTONS --- */
        .mc-btn {
            background-color: var(--btn-face);
            color: var(--btn-text);
            border: 4px solid;
            border-color: var(--btn-highlight) var(--btn-shadow) var(--btn-shadow) var(--btn-highlight);
            padding: 10px 20px;
            font-family: inherit;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            margin: 5px;
            user-select: none;
        }

        .mc-btn:active, .mc-btn.active {
            border-color: var(--btn-shadow) var(--btn-highlight) var(--btn-highlight) var(--btn-shadow);
            background-color: #8b8b8b; /* Darker when pressed */
        }

        /* --- TOGGLE SWITCH --- */
        .toggle-container {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
            margin-bottom: 5px;
        }

        /* --- NAVIGATION TABS --- */
        nav {
            display: flex;
            background-color: var(--bg-color);
            padding: 5px;
            overflow-x: auto;
        }

        nav .mc-btn {
            flex: 1;
            text-align: center;
            white-space: nowrap;
            font-size: 14px;
        }

        /* --- MAIN CONTENT AREA --- */
        main {
            flex: 1;
            padding: 15px;
            overflow-y: auto;
        }

        .section {
            display: none; /* Hidden by default */
            animation: fadeIn 0.2s;
        }
        
        .section.active {
            display: block;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(5px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* --- CONTENT CARDS --- */
        .card {
            background-color: var(--panel-color);
            border: 4px solid;
            border-color: var(--border-light) var(--border-dark) var(--border-dark) var(--border-light);
            padding: 15px;
            margin-bottom: 20px;
        }

        h2 {
            font-size: 20px;
            margin-top: 0;
            border-bottom: 2px solid var(--accent-color);
            padding-bottom: 5px;
            color: var(--text-color);
            text-shadow: 1px 1px #000;
        }

        p, li {
            font-size: 16px;
            line-height: 1.5;
        }

        ul {
            padding-left: 20px;
        }

        .stat-box {
            background-color: var(--slot-bg);
            border: 2px solid;
            border-color: var(--btn-shadow) var(--btn-highlight) var(--btn-highlight) var(--btn-shadow);
            padding: 10px;
            margin: 10px 0;
            color: #fff;
            font-size: 14px;
        }

        .highlight {
            color: #55FFFF;
        }
        
        .warning {
            color: #FF5555;
        }

        /* --- IMAGES --- */
        .img-placeholder {
            width: 100%;
            height: 180px;
            background-color: #000;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 10px;
            border: 2px solid var(--border-dark);
            position: relative;
            overflow: hidden;
        }
        
        .img-placeholder img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            image-rendering: pixelated; /* Essential for MC look */
        }

        .img-label {
            position: absolute;
            bottom: 0;
            left: 0;
            background: rgba(0,0,0,0.7);
            color: white;
            width: 100%;
            padding: 5px;
            font-size: 12px;
            text-align: center;
        }

        /* --- FOOTER --- */
        footer {
            text-align: center;
            padding: 20px;
            font-size: 12px;
            color: #888;
            background-color: var(--bg-color);
        }

    </style>
</head>
<body>

<div id="app-container">
    <header>
        <h1>MOB FARM <br>GUIDE</h1>
        <div class="toggle-container">
            <button class="mc-btn" id="theme-toggle" onclick="toggleTheme()">Mode: Night</button>
        </div>
    </header>

    <nav>
        <button class="mc-btn active" onclick="showSection('basics', this)">Basics</button>
        <button class="mc-btn" onclick="showSection('farms', this)">Farms</button>
        <button class="mc-btn" onclick="showSection('tools', this)">Tools</button>
    </nav>

    <main>
        <div id="basics" class="section active">
            <div class="card">
                <h2>Spawning Mechanics</h2>
                <div class="img-placeholder">
                    <svg width="100%" height="100%" viewBox="0 0 200 100" style="background:#222">
                        <circle cx="100" cy="50" r="40" stroke="#55FFFF" stroke-width="2" fill="none" stroke-dasharray="4"/>
                        <rect x="95" y="45" width="10" height="10" fill="#00AA00"/>
                        <text x="100" y="95" fill="white" font-size="10" text-anchor="middle" font-family="monospace">24 - 128 Blocks</text>
                    </svg>
                    <div class="img-label">The Despawn Sphere</div>
                </div>
                <p>To build effective farms, you must understand where mobs appear:</p>
                <ul>
                    <li><strong>Range:</strong> Mobs spawn between <span class="highlight">24 and 128 blocks</span> away from the player.</li>
                    <li><strong>Light Level:</strong> Since 1.18, hostile mobs only spawn at <span class="highlight">Light Level 0</span>.</li>
                    <li><strong>Mob Cap:</strong> Usually 70 hostile mobs per player. You must light up caves (perimeter) to force spawns in your farm.</li>
                </ul>
            </div>

            <div class="card">
                <h2>Spawning Conditions</h2>
                <div class="stat-box">
                    <p><span class="highlight">Solid Blocks:</span> Required for most spawns.</p>
                    <p><span class="highlight">Transparent Blocks:</span> (Glass, Leaves, Slabs) prevent spawning.</p>
                </div>
                <p><strong>Pro Tip:</strong> Use slabs or carpets on your farm roof to prevent mobs from spawning on top of the mechanism.</p>
            </div>
        </div>

        <div id="farms" class="section">
            <div class="card">
                <h2>The Classic Tower</h2>
                <div class="img-placeholder">
                     <svg width="100%" height="100%" viewBox="0 0 100 100" style="background:#555">
                        <rect x="30" y="20" width="40" height="60" fill="#333" stroke="#000" stroke-width="2"/>
                        <rect x="35" y="25" width="10" height="10" fill="#111"/> 
                        <rect x="55" y="25" width="10" height="10" fill="#111"/>
                        <rect x="40" y="80" width="20" height="20" fill="#666"/>
                     </svg>
                     <div class="img-label">Standard Drop Tower</div>
                </div>
                <p>Best for beginners. Uses gravity to weaken mobs.</p>
                <ul>
                    <li><strong>Height:</strong> Drop mobs <span class="warning">22 blocks</span> to leave them at 1 HP.</li>
                    <li><strong>Drop:</strong> 24+ blocks kills them instantly (AFK loot).</li>
                    <li><strong>Mechanism:</strong> Water streams push mobs into a central hole. Trapdoors trick AI into walking off edges.</li>
                </ul>
                <button class="mc-btn" style="width:100%">View Blueprint</button>
            </div>

            <div class="card">
                <h2>Iron Golem Farm</h2>
                <div class="img-placeholder">
                    <svg width="100%" height="100%" viewBox="0 0 100 100" style="background:#87CEEB">
                        <rect x="40" y="40" width="20" height="20" fill="#FFF"/>
                        <rect x="45" y="45" width="10" height="10" fill="#FF5555"/>
                        <rect x="30" y="70" width="40" height="10" fill="#888"/>
                    </svg>
                    <div class="img-label">Villager Panic Setup</div>
                </div>
                <p>Essential for hoppers and anvils.</p>
                <div class="stat-box">
                    Requirements:<br>
                    - 3 Villagers<br>
                    - 1 Zombie (in a boat/minecart)<br>
                    - Name tag for Zombie
                </div>
                <p>Villagers must "sleep" (lie in bed for a split second) and be "scared" by the zombie to summon a Golem.</p>
            </div>
        </div>

        <div id="tools" class="section">
            <div class="card">
                <h2>Fall Damage Calculator</h2>
                <p>Calculate how many blocks a mob needs to fall.</p>
                <div class="stat-box" style="background-color: var(--bg-color); border: 2px inset #fff;">
                    <label>Mob Health (Hearts):</label><br>
                    <input type="number" id="hp-input" value="20" style="width: 100%; margin-top:5px; padding: 5px; background: #000; color: #fff; border: 2px solid #555; font-family: inherit;">
                </div>
                <button class="mc-btn" onclick="calculateFall()">Calculate Drop</button>
                <p id="calc-result" style="margin-top: 10px; color: var(--title-color);"></p>
            </div>

            <div class="card">
                <h2>Light Level Guide</h2>
                <table style="width:100%; border-collapse: collapse; font-size: 14px;">
                    <tr style="background:rgba(0,0,0,0.2)">
                        <td style="padding:5px; border:1px solid #555;">Source</td>
                        <td style="padding:5px; border:1px solid #555;">Level</td>
                    </tr>
                    <tr>
                        <td style="padding:5px; border:1px solid #555;">Torch</td>
                        <td style="padding:5px; border:1px solid #555; color:#fcfc00">14</td>
                    </tr>
                    <tr>
                        <td style="padding:5px; border:1px solid #555;">Glowstone</td>
                        <td style="padding:5px; border:1px solid #555; color:#fcfc00">15</td>
                    </tr>
                    <tr>
                        <td style="padding:5px; border:1px solid #555;">Soul Torch</td>
                        <td style="padding:5px; border:1px solid #555; color:#55FFFF">10</td>
                    </tr>
                    <tr>
                        <td style="padding:5px; border:1px solid #555;">Mushroom</td>
                        <td style="padding:5px; border:1px solid #555; color:#AA0000">1</td>
                    </tr>
                </table>
            </div>
        </div>
    </main>

    <footer>
        <p>Not an official Minecraft product.<br>Approved by no one.</p>
    </footer>
</div>

<script>
    // --- THEME TOGGLE LOGIC ---
    function toggleTheme() {
        const body = document.body;
        const btn = document.getElementById('theme-toggle');
        
        body.classList.toggle('light-mode');
        
        if (body.classList.contains('light-mode')) {
            btn.innerText = "Mode: Day";
        } else {
            btn.innerText = "Mode: Night";
        }
    }

    // --- TAB NAVIGATION LOGIC ---
    function showSection(sectionId, btnElement) {
        // Hide all sections
        const sections = document.querySelectorAll('.section');
        sections.forEach(sec => sec.classList.remove('active'));
        
        // Show target section
        document.getElementById(sectionId).classList.add('active');
        
        // Update buttons
        const navBtns = document.querySelectorAll('nav .mc-btn');
        navBtns.forEach(btn => btn.classList.remove('active'));
        btnElement.classList.add('active');
    }

    // --- SIMPLE TOOL LOGIC ---
    function calculateFall() {
        const hp = document.getElementById('hp-input').value;
        // Formula: Damage = Fall Distance - 3
        // To kill: Distance = HP + 3
        // To leave at half heart (1 HP): Distance = (HP - 1) + 3
        
        const killBlocks = parseInt(hp) + 3;
        const weakenBlocks = (parseInt(hp) - 1) + 3;
        
        const resultText = `Kill: ${killBlocks} blocks<br>Weaken (1HP): ${weakenBlocks} blocks`;
        document.getElementById('calc-result').innerHTML = resultText;
    }
</script>

</body>
</html>
```

### Prompt 2
please add a tab to see the health and spawning conditions of every hostile mob as of the most recent update. add the tab next to basics, farms and tools. keep everything else the same only add to it

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crafter's Guide: Mob Farms</title>
    <style>
        /* --- CORE VARIABLES --- */
        :root {
            /* Default (Dark/Night Mode) - Classic GUI Grey */
            --bg-color: #121212;
            --panel-color: #3b3b3b; /* Bedrock/Deepslate feel */
            --text-color: #e0e0e0;
            --accent-color: #727272;
            
            --btn-face: #989898; /* Classic button grey */
            --btn-shadow: #3f3f3f;
            --btn-highlight: #ffffff;
            --btn-text: #000000;
            
            --slot-bg: #222222;
            --border-light: #ffffff;
            --border-dark: #202020;
            
            --title-color: #fcfc00; /* Classic Minecraft Gold */
            --link-color: #55FFFF;
            
            --health-color: #FF5555; /* Heart Red */
        }

        /* Light (Day Mode) - Dirt/Menu Style */
        body.light-mode {
            --bg-color: #4a3424; /* Dirt background */
            --panel-color: #c6c6c6; /* Classic Menu Grey */
            --text-color: #202020;
            --accent-color: #a0a0a0;
            
            --btn-face: #d6d6d6;
            --btn-shadow: #555555;
            --btn-highlight: #ffffff;
            --btn-text: #000000;
            
            --slot-bg: #8b8b8b;
            --border-light: #ffffff;
            --border-dark: #373737;
            
            --title-color: #404040;
            --link-color: #0000AA;
            
            --health-color: #AA0000;
        }

        /* --- GLOBAL RESETS --- */
        * {
            box-sizing: border-box;
            -webkit-tap-highlight-color: transparent;
        }

        body {
            font-family: 'Courier New', Courier, monospace; /* Web-safe monospaced */
            font-weight: bold;
            background-color: var(--bg-color);
            background-image: 
                linear-gradient(rgba(0,0,0,0.1) 1px, transparent 1px),
                linear-gradient(90deg, rgba(0,0,0,0.1) 1px, transparent 1px);
            background-size: 20px 20px;
            color: var(--text-color);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
        }

        /* --- CONTAINER --- */
        #app-container {
            width: 100%;
            max-width: 600px; /* Phone constrained */
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            background-color: var(--bg-color);
        }

        /* --- HEADER --- */
        header {
            background-color: var(--panel-color);
            border-bottom: 4px solid var(--border-dark);
            padding: 15px;
            text-align: center;
            position: sticky;
            top: 0;
            z-index: 100;
            box-shadow: 0 4px 10px rgba(0,0,0,0.5);
        }

        h1 {
            font-size: 24px;
            margin: 0 0 10px 0;
            color: var(--title-color);
            text-shadow: 2px 2px 0px #000000;
            letter-spacing: -1px;
        }

        /* --- MC STYLE BUTTONS --- */
        .mc-btn {
            background-color: var(--btn-face);
            color: var(--btn-text);
            border: 4px solid;
            border-color: var(--btn-highlight) var(--btn-shadow) var(--btn-shadow) var(--btn-highlight);
            padding: 10px 20px;
            font-family: inherit;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            margin: 5px;
            user-select: none;
        }

        .mc-btn:active, .mc-btn.active {
            border-color: var(--btn-shadow) var(--btn-highlight) var(--btn-highlight) var(--btn-shadow);
            background-color: #8b8b8b; /* Darker when pressed */
        }

        /* --- TOGGLE SWITCH --- */
        .toggle-container {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
            margin-bottom: 5px;
        }

        /* --- NAVIGATION TABS --- */
        nav {
            display: flex;
            background-color: var(--bg-color);
            padding: 5px;
            overflow-x: auto;
        }

        nav .mc-btn {
            flex: 1;
            text-align: center;
            white-space: nowrap;
            font-size: 14px;
            padding: 10px 5px;
        }

        /* --- MAIN CONTENT AREA --- */
        main {
            flex: 1;
            padding: 15px;
            overflow-y: auto;
        }

        .section {
            display: none; /* Hidden by default */
            animation: fadeIn 0.2s;
        }
        
        .section.active {
            display: block;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(5px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* --- CONTENT CARDS --- */
        .card {
            background-color: var(--panel-color);
            border: 4px solid;
            border-color: var(--border-light) var(--border-dark) var(--border-dark) var(--border-light);
            padding: 15px;
            margin-bottom: 20px;
        }

        h2 {
            font-size: 20px;
            margin-top: 0;
            border-bottom: 2px solid var(--accent-color);
            padding-bottom: 5px;
            color: var(--text-color);
            text-shadow: 1px 1px #000;
        }

        h3 {
            font-size: 16px;
            margin-bottom: 5px;
            color: var(--title-color);
        }

        p, li {
            font-size: 16px;
            line-height: 1.5;
        }

        ul {
            padding-left: 20px;
        }

        .stat-box {
            background-color: var(--slot-bg);
            border: 2px solid;
            border-color: var(--btn-shadow) var(--btn-highlight) var(--btn-highlight) var(--btn-shadow);
            padding: 10px;
            margin: 10px 0;
            color: #fff;
            font-size: 14px;
        }

        .highlight {
            color: #55FFFF;
        }
        
        .warning {
            color: #FF5555;
        }

        .hearts {
            color: var(--health-color);
            font-size: 14px;
        }

        /* --- TABLE STYLES --- */
        .mob-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 14px;
            margin-top: 10px;
        }
        
        .mob-table td, .mob-table th {
            border: 2px solid var(--border-dark);
            padding: 8px;
            text-align: left;
        }

        .mob-table th {
            background-color: rgba(0,0,0,0.2);
            color: var(--highlight);
        }

        /* --- IMAGES --- */
        .img-placeholder {
            width: 100%;
            height: 180px;
            background-color: #000;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 10px;
            border: 2px solid var(--border-dark);
            position: relative;
            overflow: hidden;
        }
        
        .img-placeholder img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            image-rendering: pixelated; /* Essential for MC look */
        }

        .img-label {
            position: absolute;
            bottom: 0;
            left: 0;
            background: rgba(0,0,0,0.7);
            color: white;
            width: 100%;
            padding: 5px;
            font-size: 12px;
            text-align: center;
        }

        /* --- FOOTER --- */
        footer {
            text-align: center;
            padding: 20px;
            font-size: 12px;
            color: #888;
            background-color: var(--bg-color);
        }

    </style>
</head>
<body>

<div id="app-container">
    <header>
        <h1>MOB FARM <br>GUIDE</h1>
        <div class="toggle-container">
            <button class="mc-btn" id="theme-toggle" onclick="toggleTheme()">Mode: Night</button>
        </div>
    </header>

    <nav>
        <button class="mc-btn active" onclick="showSection('basics', this)">Basics</button>
        <button class="mc-btn" onclick="showSection('farms', this)">Farms</button>
        <button class="mc-btn" onclick="showSection('tools', this)">Tools</button>
        <button class="mc-btn" onclick="showSection('mobs', this)">Mobs</button>
    </nav>

    <main>
        <div id="basics" class="section active">
            <div class="card">
                <h2>Spawning Mechanics</h2>
                <div class="img-placeholder">
                    <svg width="100%" height="100%" viewBox="0 0 200 100" style="background:#222">
                        <circle cx="100" cy="50" r="40" stroke="#55FFFF" stroke-width="2" fill="none" stroke-dasharray="4"/>
                        <rect x="95" y="45" width="10" height="10" fill="#00AA00"/>
                        <text x="100" y="95" fill="white" font-size="10" text-anchor="middle" font-family="monospace">24 - 128 Blocks</text>
                    </svg>
                    <div class="img-label">The Despawn Sphere</div>
                </div>
                <p>To build effective farms, you must understand where mobs appear:</p>
                <ul>
                    <li><strong>Range:</strong> Mobs spawn between <span class="highlight">24 and 128 blocks</span> away from the player.</li>
                    <li><strong>Light Level:</strong> Since 1.18, hostile mobs only spawn at <span class="highlight">Light Level 0</span>.</li>
                    <li><strong>Mob Cap:</strong> Usually 70 hostile mobs per player. You must light up caves (perimeter) to force spawns in your farm.</li>
                </ul>
            </div>

            <div class="card">
                <h2>Spawning Conditions</h2>
                <div class="stat-box">
                    <p><span class="highlight">Solid Blocks:</span> Required for most spawns.</p>
                    <p><span class="highlight">Transparent Blocks:</span> (Glass, Leaves, Slabs) prevent spawning.</p>
                </div>
                <p><strong>Pro Tip:</strong> Use slabs or carpets on your farm roof to prevent mobs from spawning on top of the mechanism.</p>
            </div>
        </div>

        <div id="farms" class="section">
            <div class="card">
                <h2>The Classic Tower</h2>
                <div class="img-placeholder">
                     <svg width="100%" height="100%" viewBox="0 0 100 100" style="background:#555">
                        <rect x="30" y="20" width="40" height="60" fill="#333" stroke="#000" stroke-width="2"/>
                        <rect x="35" y="25" width="10" height="10" fill="#111"/> 
                        <rect x="55" y="25" width="10" height="10" fill="#111"/>
                        <rect x="40" y="80" width="20" height="20" fill="#666"/>
                     </svg>
                     <div class="img-label">Standard Drop Tower</div>
                </div>
                <p>Best for beginners. Uses gravity to weaken mobs.</p>
                <ul>
                    <li><strong>Height:</strong> Drop mobs <span class="warning">22 blocks</span> to leave them at 1 HP.</li>
                    <li><strong>Drop:</strong> 24+ blocks kills them instantly (AFK loot).</li>
                    <li><strong>Mechanism:</strong> Water streams push mobs into a central hole. Trapdoors trick AI into walking off edges.</li>
                </ul>
                <button class="mc-btn" style="width:100%">View Blueprint</button>
            </div>

            <div class="card">
                <h2>Iron Golem Farm</h2>
                <div class="img-placeholder">
                    <svg width="100%" height="100%" viewBox="0 0 100 100" style="background:#87CEEB">
                        <rect x="40" y="40" width="20" height="20" fill="#FFF"/>
                        <rect x="45" y="45" width="10" height="10" fill="#FF5555"/>
                        <rect x="30" y="70" width="40" height="10" fill="#888"/>
                    </svg>
                    <div class="img-label">Villager Panic Setup</div>
                </div>
                <p>Essential for hoppers and anvils.</p>
                <div class="stat-box">
                    Requirements:<br>
                    - 3 Villagers<br>
                    - 1 Zombie (in a boat/minecart)<br>
                    - Name tag for Zombie
                </div>
                <p>Villagers must "sleep" (lie in bed for a split second) and be "scared" by the zombie to summon a Golem.</p>
            </div>
        </div>

        <div id="tools" class="section">
            <div class="card">
                <h2>Fall Damage Calculator</h2>
                <p>Calculate how many blocks a mob needs to fall.</p>
                <div class="stat-box" style="background-color: var(--bg-color); border: 2px inset #fff;">
                    <label>Mob Health (Hearts):</label><br>
                    <input type="number" id="hp-input" value="20" style="width: 100%; margin-top:5px; padding: 5px; background: #000; color: #fff; border: 2px solid #555; font-family: inherit;">
                </div>
                <button class="mc-btn" onclick="calculateFall()">Calculate Drop</button>
                <p id="calc-result" style="margin-top: 10px; color: var(--title-color);"></p>
            </div>

            <div class="card">
                <h2>Light Level Guide</h2>
                <table class="mob-table">
                    <tr>
                        <th>Source</th>
                        <th>Level</th>
                    </tr>
                    <tr>
                        <td>Torch</td>
                        <td style="color:#fcfc00">14</td>
                    </tr>
                    <tr>
                        <td>Glowstone</td>
                        <td style="color:#fcfc00">15</td>
                    </tr>
                    <tr>
                        <td>Soul Torch</td>
                        <td style="color:#55FFFF">10</td>
                    </tr>
                    <tr>
                        <td>Mushroom</td>
                        <td style="color:#AA0000">1</td>
                    </tr>
                </table>
            </div>
        </div>

        <div id="mobs" class="section">
            <div class="card">
                <h2>New & Special Mobs (1.21+)</h2>
                
                <div class="stat-box">
                    <h3>The Breeze</h3>
                    <p><span class="hearts">❤❤❤❤❤❤❤❤</span> (30 HP)</p>
                    <p><strong>Spawn:</strong> Trial Chambers (from Trial Spawner)</p>
                    <p><strong>Notes:</strong> Deflects projectiles. Drops Breeze Rods.</p>
                </div>

                <div class="stat-box">
                    <h3>The Bogged</h3>
                    <p><span class="hearts">❤❤❤❤</span> (16 HP)</p>
                    <p><strong>Spawn:</strong> Swamps, Mangrove Swamps, Trial Chambers</p>
                    <p><strong>Notes:</strong> Shoots poison arrows. Slower fire rate.</p>
                </div>

                <div class="stat-box">
                    <h3>The Creaking</h3>
                    <p><span class="warning">Invulnerable*</span></p>
                    <p><strong>Spawn:</strong> Pale Garden (Night), linked to Creaking Heart block.</p>
                    <p><strong>Notes:</strong> Only moves when not looked at. *Must destroy the "Creaking Heart" block (between Pale Oak logs) to kill it.</p>
                </div>
            </div>

            <div class="card">
                <h2>Classic Hostiles</h2>
                <table class="mob-table">
                    <tr>
                        <th>Mob</th>
                        <th>HP</th>
                        <th>Cond.</th>
                    </tr>
                    <tr>
                        <td>Zombie</td>
                        <td>20</td>
                        <td>Light 0</td>
                    </tr>
                    <tr>
                        <td>Skeleton</td>
                        <td>20</td>
                        <td>Light 0</td>
                    </tr>
                    <tr>
                        <td>Creeper</td>
                        <td>20</td>
                        <td>Light 0</td>
                    </tr>
                    <tr>
                        <td>Spider</td>
                        <td>16</td>
                        <td>Light 0 (3x3 space)</td>
                    </tr>
                    <tr>
                        <td>Enderman</td>
                        <td>40</td>
                        <td>Light 0 / 3-high</td>
                    </tr>
                    <tr>
                        <td>Witch</td>
                        <td>26</td>
                        <td>Light 0</td>
                    </tr>
                    <tr>
                        <td>Slime</td>
                        <td>16/4/1</td>
                        <td>Swamp / Y&lt;40</td>
                    </tr>
                    <tr>
                        <td>Blaze</td>
                        <td>20</td>
                        <td>Nether Fortress</td>
                    </tr>
                </table>
            </div>
        </div>

    </main>

    <footer>
        <p>Not an official Minecraft product.<br>Approved by no one.</p>
    </footer>
</div>

<script>
    // --- THEME TOGGLE LOGIC ---
    function toggleTheme() {
        const body = document.body;
        const btn = document.getElementById('theme-toggle');
        
        body.classList.toggle('light-mode');
        
        if (body.classList.contains('light-mode')) {
            btn.innerText = "Mode: Day";
        } else {
            btn.innerText = "Mode: Night";
        }
    }

    // --- TAB NAVIGATION LOGIC ---
    function showSection(sectionId, btnElement) {
        // Hide all sections
        const sections = document.querySelectorAll('.section');
        sections.forEach(sec => sec.classList.remove('active'));
        
        // Show target section
        document.getElementById(sectionId).classList.add('active');
        
        // Update buttons
        const navBtns = document.querySelectorAll('nav .mc-btn');
        navBtns.forEach(btn => btn.classList.remove('active'));
        btnElement.classList.add('active');
    }

    // --- SIMPLE TOOL LOGIC ---
    function calculateFall() {
        const hp = document.getElementById('hp-input').value;
        // Formula: Damage = Fall Distance - 3
        // To kill: Distance = HP + 3
        // To leave at half heart (1 HP): Distance = (HP - 1) + 3
        
        const killBlocks = parseInt(hp) + 3;
        const weakenBlocks = (parseInt(hp) - 1) + 3;
        
        const resultText = `Kill: ${killBlocks} blocks<br>Weaken (1HP): ${weakenBlocks} blocks`;
        document.getElementById('calc-result').innerHTML = resultText;
    }
</script>

</body>
</html>
```