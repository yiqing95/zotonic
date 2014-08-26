<!DOCTYPE html>
<html lang="{{ z_language|default:"en"|escape }}">
    <head>
        <meta charset="utf-8">
	<title>{% block title %}{% endblock %}</title>

	<link rel="icon" href="/favicon.ico" type="image/x-icon">
	<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
	
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="author" content="Arjan Scherpenisse">

	{% all include "_html_head.tpl" %}

	{% lib
		"bootstrap/css/bootstrap.min.css"
		"css/jquery.loadmask.css" 
		"css/project.css"
	%}

	{% block html_head_extra %}{% endblock %}
    </head>

    <body class="{% block page_class %}{% endblock %}">

        <div class="container">
            {% block navbar %}
            	{% include "_navbar.tpl" %}
            {% endblock %}

            <div class="row">
                <div class="span12" id="content-area">
		    {% block content_area %}
		    {% block content %}{% endblock %}
		    {% block sidebar %}{% endblock %}
		    {% endblock %}
                </div>
            </div>
	    
            <div class="navbar navbar-bottom" id="footer">
		    {% include "_footer.tpl" %}
            </div>

        </div><!-- end container -->
        
        {% block javascript %}
	    {% include "_js_include.tpl" %}
        {% endblock %}

	{% block ua_probe %}
		{% include "_ua_probe.tpl"%}
	{% endblock %}
</body>
</html>
