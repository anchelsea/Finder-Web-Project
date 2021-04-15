<!DOCTYPE html>
<html lang="en" >

<head>
    <meta charset="UTF-8">
    <title>Tinder swipe cards</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
<%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">--%>

    <link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>

    <link rel="stylesheet" href="css/style.css">
    <style>
        /*Downloaded from https://www.codeseek.co/RobVermeer/tinder-swipe-cards-japZpY */
        *, *:before, *:after {
            box-sizing: border-box;
            padding: 0;
            margin: 0;
        }

        body {
            background: #CCFBFE;
            overflow: hidden;
            font-family: sans-serif;
        }

        .tinder {
            width: 100vw;
            height: 100vh;
            overflow: hidden;
            display: flex;
            flex-direction: column;
            position: relative;
            opacity: 0;
            transition: opacity 0.1s ease-in-out;
        }

        .loaded.tinder {
            opacity: 1;
        }

        .tinder--status {
            position: absolute;
            top: 50%;
            margin-top: -30px;
            z-index: 2;
            width: 100%;
            text-align: center;
            pointer-events: none;
        }

        .tinder--status i {
            font-size: 100px;
            opacity: 0;
            -webkit-transform: scale(0.3);
            transform: scale(0.3);
            transition: all 0.2s ease-in-out;
            position: absolute;
            width: 100px;
            margin-left: -50px;
        }

        .tinder_love .fa-heart {
            opacity: 0.7;
            -webkit-transform: scale(1);
            transform: scale(1);
        }

        .tinder_nope .fa-remove {
            opacity: 0.7;
            -webkit-transform: scale(1);
            transform: scale(1);
        }

        .tinder--cards {
            flex-grow: 1;
            padding-top: 40px;
            text-align: center;
            display: flex;
            justify-content: center;
            align-items: flex-end;
            z-index: 1;
        }

        .tinder--card {
            display: inline-block;
            width: 90vw;
            max-width: 400px;
            height: 70vh;
            background: #FFFFFF;
            padding-bottom: 40px;
            border-radius: 8px;
            overflow: hidden;
            position: absolute;
            will-change: transform;
            transition: all 0.3s ease-in-out;
            cursor: grab;
        }

        .moving.tinder--card {
            transition: none;
            cursor: grabbing;
        }

        .tinder--card img {
            max-width: 100%;
            pointer-events: none;
        }

        .tinder--card h3 {
            margin-top: 32px;
            font-size: 32px;
            padding: 0 16px;
            pointer-events: none;
        }

        .tinder--card p {
            margin-top: 24px;
            font-size: 20px;
            padding: 0 16px;
            pointer-events: none;
        }

        .tinder--buttons {
            flex: 0 0 100px;
            text-align: center;
            padding-top: 20px;
        }

        .tinder--buttons button {
            border-radius: 50%;
            line-height: 60px;
            width: 60px;
            border: 0;
            background: #FFFFFF;
            display: inline-block;
            margin: 0 8px;
        }

        .tinder--buttons button:focus {
            outline: 0;
        }

        .tinder--buttons i {
            font-size: 32px;
            vertical-align: middle;
        }

        .fa-heart {
            color: #FFACE4;
        }

        .fa-remove {
            color: #CDD6DD;
        }

    </style>
</head>

<body>

<!-- YOUR CUSTOM MARKUP -->

<h1>Custom Website Overlay</h1>
<p>This is just a demo. If you like this and use it yourself, I would appreciate if you credit me (Caleb Miller) at <a href="https://cmiller.tech">cmiller.tech</a>.</p>
<p>Some features from the full version have been disabled, including sound effects and the menu system. Getting these to work well on a custom site involves even more work.</p>
<p class="scroll-notice">The fireworks remain fixed as you scroll the page.</p>


<!-- FIREWORK APP MARKUP -->
<div class="fireworks-container">
    <div class="loading-init">
        <!-- 		<div class="loading-init__header">Loading</div> -->
        <!-- 		<div class="loading-init__status">Assembling Shells</div> -->
    </div>
    <div class="stage-container remove">
        <div class="canvas-container">
            <canvas id="trails-canvas"></canvas>
            <canvas id="main-canvas"></canvas>
        </div>
        <div class="controls">
            <div class="btn pause-btn">
                <svg fill="white" width="24" height="24"><use href="#icon-pause" xlink:href="#icon-pause"></use></svg>
            </div>
            <div class="btn sound-btn">
                <svg fill="white" width="24" height="24"><use href="#icon-sound-off" xlink:href="#icon-sound-off"></use></svg>
            </div>
            <div class="btn settings-btn">
                <svg fill="white" width="24" height="24"><use href="#icon-settings" xlink:href="#icon-settings"></use></svg>
            </div>
        </div>
        <div class="menu hide">
            <div class="menu__inner-wrap">
                <div class="btn btn--bright close-menu-btn">
                    <svg fill="white" width="24" height="24"><use href="#icon-close" xlink:href="#icon-close"></use></svg>
                </div>
                <div class="menu__header">Settings</div>
                <div class="menu__subheader">For more info, click any label.</div>
                <form>
                    <div class="form-option form-option--select">
                        <label class="shell-type-label">Shell Type</label>
                        <select class="shell-type"></select>
                    </div>
                    <div class="form-option form-option--select">
                        <label class="shell-size-label">Shell Size</label>
                        <select class="shell-size"></select>
                    </div>
                    <div class="form-option form-option--select">
                        <label class="quality-ui-label">Quality</label>
                        <select class="quality-ui"></select>
                    </div>
                    <div class="form-option form-option--select">
                        <label class="sky-lighting-label">Sky Lighting</label>
                        <select class="sky-lighting"></select>
                    </div>
                    <div class="form-option form-option--select">
                        <label class="scaleFactor-label">Scale</label>
                        <select class="scaleFactor"></select>
                    </div>
                    <div class="form-option form-option--checkbox">
                        <label class="auto-launch-label">Auto Fire</label>
                        <input class="auto-launch" type="checkbox" />
                    </div>
                    <div class="form-option form-option--checkbox form-option--finale-mode">
                        <label class="finale-mode-label">Finale Mode</label>
                        <input class="finale-mode" type="checkbox" />
                    </div>
                    <div class="form-option form-option--checkbox">
                        <label class="hide-controls-label">Hide Controls</label>
                        <input class="hide-controls" type="checkbox" />
                    </div>
                    <div class="form-option form-option--checkbox form-option--fullscreen">
                        <label class="fullscreen-label">Fullscreen</label>
                        <input class="fullscreen" type="checkbox" />
                    </div>
                    <div class="form-option form-option--checkbox">
                        <label class="long-exposure-label">Open Shutter</label>
                        <input class="long-exposure" type="checkbox" />
                    </div>
                </form>
                <div class="credits">
                    Passionately built by <a href="https://cmiller.tech/" target="_blank">Caleb Miller</a>.
                </div>
            </div>
        </div>
    </div>
    <div class="help-modal">
        <div class="help-modal__overlay"></div>
        <div class="help-modal__dialog">
            <div class="help-modal__header"></div>
            <div class="help-modal__body"></div>
            <button type="button" class="help-modal__close-btn">Close</button>
        </div>
    </div>
</div>
</div>
<script src='https://hammerjs.github.io/dist/hammer.min.js'></script>

<script>

    var tinderContainer = document.querySelector('.tinder');
    var allCards = document.querySelectorAll('.tinder--card');
    var nope = document.getElementById('nope');
    var love = document.getElementById('love');

    function initCards(card, index) {
        var newCards = document.querySelectorAll('.tinder--card:not(.removed)');

        newCards.forEach(function (card, index) {
            card.style.zIndex = allCards.length - index;
           /* card.style.transform = 'scale(' + (20 - index) / 20 + ') translateY(-' + 30 * index + 'px)';*/
            card.style.opacity = (10 - index) / 10;
        });

        tinderContainer.classList.add('loaded');
    }

    initCards();

    allCards.forEach(function (el) {
        var hammertime = new Hammer(el);

        hammertime.on('pan', function (event) {
            el.classList.add('moving');
        });

        hammertime.on('pan', function (event) {
            if (event.deltaX === 0) return;
            if (event.center.x === 0 && event.center.y === 0) return;

            tinderContainer.classList.toggle('tinder_love', event.deltaX > 0);
            tinderContainer.classList.toggle('tinder_nope', event.deltaX < 0);

            var xMulti = event.deltaX * 0.03;
            var yMulti = event.deltaY / 80;
            var rotate = xMulti * yMulti;

            event.target.style.transform = 'translate(' + event.deltaX + 'px, ' + event.deltaY + 'px) rotate(' + rotate + 'deg)';
        });

        hammertime.on('panend', function (event) {
            el.classList.remove('moving');
            tinderContainer.classList.remove('tinder_love');
            tinderContainer.classList.remove('tinder_nope');

            var moveOutWidth = document.body.clientWidth;
            var keep = Math.abs(event.deltaX) < 80 || Math.abs(event.velocityX) < 0.5;

            event.target.classList.toggle('removed', !keep);

            if (keep) {
                event.target.style.transform = '';
            } else {
                var endX = Math.max(Math.abs(event.velocityX) * moveOutWidth, moveOutWidth);
                var toX = event.deltaX > 0 ? endX : -endX;
                var endY = Math.abs(event.velocityY) * moveOutWidth;
                var toY = event.deltaY > 0 ? endY : -endY;
                var xMulti = event.deltaX * 0.03;
                var yMulti = event.deltaY / 80;
                var rotate = xMulti * yMulti;

                event.target.style.transform = 'translate(' + toX + 'px, ' + (toY + event.deltaY) + 'px) rotate(' + rotate + 'deg)';
                initCards();
            }
        });
    });

    function createButtonListener(love) {
        return function (event) {
            var cards = document.querySelectorAll('.tinder--card:not(.removed)');
            var moveOutWidth = document.body.clientWidth * 1.5;

            if (!cards.length) return false;

            var card = cards[0];

            card.classList.add('removed');

            if (love) {
                card.style.transform = 'translate(' + moveOutWidth + 'px, -100px) rotate(-30deg)';
            } else {
                card.style.transform = 'translate(-' + moveOutWidth + 'px, -100px) rotate(30deg)';
            }

            initCards();

            event.preventDefault();
        };
    }

    var nopeListener = createButtonListener(false);
    var loveListener = createButtonListener(true);

    nope.addEventListener('click', nopeListener);
    love.addEventListener('click', loveListener);
</script>




</body>

</html>