{!! Form::open(array('route' => 'route.name', 'method' => 'POST')) !!}
	<ul>
		<li>
			{!! Form::label('code', 'Code:') !!}
			{!! Form::text('code') !!}
		</li>
		<li>
			{!! Form::label('brand_name', 'Brand_name:') !!}
			{!! Form::text('brand_name') !!}
		</li>
		<li>
			{!! Form::submit() !!}
		</li>
	</ul>
{!! Form::close() !!}