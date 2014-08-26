{% extends "base.tpl" %}

{% block html_head_extra %}
{% lib
    "css/jquery.gridster.min.css"
    "css/styles.css"
%}
{% endblock %}

{% block title %}Zotonic {_ Dashboard _}{% endblock %}

{% block content %}

<div id="board-content" class="row">
    <div class="gridster">
        <ul data-bind="grid: true">
        </ul>
    </div>
</div>

<div id="main-header" style="display:none"></div>
</div>

<div style="display:hidden">
    <ul data-bind="template: { name: 'pane-template', foreach: panes}">
    </ul>
</div>

{% include "_dashboard_pane_template.tpl" %}

{% endblock %}

{% block javascript %}

{% include "_js_include_jquery.tpl" %}

{% lib
        "bootstrap/js/bootstrap.min.js"
        "js/apps/zotonic-1.0.js"
        "js/apps/z.widgetmanager.js"
        "js/modules/ubf.js"
        "js/modules/livevalidation-1.3.js"
        "js/modules/z.inputoverlay.js"
%}

{% lib
        "js/knockout.js"
        "js/underscore.js"

        "js/raphael.2.1.0.min.js"
        "js/jquery.gridster.js"

        "js/jquery.sparkline.min.js"
        "js/jquery.caret.js"
        "js/justgage.1.0.1.js"

        "js/freeboard/freeboard.js"
        "js/freeboard/plugins/freeboard.datasources.js"
        "js/freeboard/plugins/freeboard.widgets.js"

        "js/freeboard_helpers.js"
%}

{% include "_js_dashboard.tpl" sites=sites %}

<script type="text/javascript">
        $(function()
        {
            $.widgetManager();
        });
</script>

{% script %}

{% endblock %}



