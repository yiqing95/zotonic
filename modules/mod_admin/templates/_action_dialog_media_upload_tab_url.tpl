<div class="tab-pane" id="{{ tab }}-url">
	{# todo: check the content_group_id #}

	{% wire id=#urlform type="submit" 
		postback={media_url_embed 
						subject_id=subject_id predicate=predicate  
						id=id  
						stay=stay 
						actions=actions callback=callback
						discover_elt=#discover} 
		delegate=`z_admin_media_discover` 
	%}
	<form id="{{ #urlform }}" method="POST" action="postback" class="form form-horizontal">
		<p>
		    {_ Enter a URL or embed code. It will be analyzed and you can choose how to import the data. _}
		</p>

		<div class="form-group row">
		    <label class="control-label col-md-3" for="upload_file">{_ URL or Embed Code_}</label>
            <div class="col-md-9">
		        <textarea type="text" class="col-lg-4 col-md-4 form-control do_autofocus" id="url" name="url" rows="3"></textarea>
		        {% validate id="url" type={presence} %}
		        <p class="help-block">{_ Any embed code will be sanitized. Only whitelisted sites are allowed in embed codes. _}</p>
            </div>
		</div>

		<div class="modal-footer">
		    {% button class="btn btn-default" action={dialog_close} text=_"Cancel" tag="a" %}
		    <button class="btn btn-primary" type="submit">{_ Discover media _}</button>
	    </div>
	</form>

	<div id="{{ #discover }}" style="display:none">
	</div>
</div>

{% if is_oembed %}
    {% javascript %}
        $('#{{ tab }} a[href="#{{ tab }}-oembed"]').tab('show');
    {% endjavascript %}
{% endif %}

{#
<div class="tab-pane" id="{{ tab }}-url">
	<p>
	    {_ Upload a file which is already on the internet. _}
	    {% if not id %}
	        {_ You have to specify a description of the file to make it easier to find and share. _}
	    {% endif %}
	</p>

	{% wire id=#urlform type="submit" 
		postback={media_url predicate=predicate actions=actions id=id subject_id=subject_id stay=stay callback=callback} 
		delegate=`action_admin_dialog_media_upload` 
	%}
	<form id="{{ #urlform }}" method="POST" action="postback" class="form form-horizontal">
	
		<div class="form-group row">
		    <label class="control-label col-md-3" for="upload_file">{_ Media URL _}</label>
            <div class="col-md-9">
		        <input type="text" class="col-lg-4 col-md-4 form-control do_autofocus" id="url" name="url" />
		        {% validate id="url" type={presence} type={format pattern="^https?://.+"} %}
            </div>
		</div>
    
        {% if not id %}
		    <div class="form-group row">
		        <label class="control-label col-md-3" for="new_media_title">{_ Media title _}</label>
                <div class="col-md-9">
		            <input type="text" class="col-lg-4 col-md-4 form-control" id="new_media_title_url" name="new_media_title_url" value="{{ title|escape }}" />
		            {% validate id="new_media_title_url" type={presence} %}
                </div>
		    </div>
		{% endif %}
		
		<div class="modal-footer">
		    {% button class="btn btn-default" action={dialog_close} text=_"Cancel" tag="a" %}
		    <button class="btn btn-primary" type="submit">{% if not id %}{_ Make media item _}{% else %}{_ Replace media item _}{% endif %}</button>
	    </div>
	</form>
</div>
#}
