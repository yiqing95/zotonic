
<p>Please specify the new trace rule.</p>

{% wire id=#form type="submit" postback={add} delegate="controller_wmtrace_conf" %}
<form id="{{ #form }}" method="POST" action="postback">

	<div>

		<div>
			<label for="{{ #resource }}">Resource</label>
			<select class="form-control" id="{{ #resource }}" name="resource">
			{% for res in resources %}
				<option value="{{res}}">
					{{ indent }}{{ res }}
				</option>
			{% endfor %}
			</select>
		</div>

		<div>
			<button type="submit">Add trace rule</button>
			{% button text="Cancel" action={dialog_close} tag="a" %}
		</div>

	</div>
</form>
