<script type="text/html" id="pane-template">
    <li data-bind="pane: true">
        <header>
            <h1 data-bind="text: title"></h1>
        </header>
        <section data-bind="foreach: widgets">
            <div class="sub-section" data-bind="css: 'sub-section-height-' + height()">
                <div class="widget" data-bind="widget: true, css:{fillsize:fillSize}"></div>
                <div class="sub-section-tools">
                </div>
            </div>
        </section>
    </li>
</script>
