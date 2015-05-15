{!! Form::open(array('route' => 'route.name', 'method' => 'POST')) !!}
	<ul>
		<li>
			{!! Form::label('subsc_name', 'Subsc_name:') !!}
			{!! Form::text('subsc_name') !!}
		</li>
		<li>
			{!! Form::label('subsc_term_months', 'Subsc_term_months:') !!}
			{!! Form::text('subsc_term_months') !!}
		</li>
		<li>
			{!! Form::submit() !!}
		</li>
	</ul>
{!! Form::close() !!}