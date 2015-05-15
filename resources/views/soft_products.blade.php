{!! Form::open(array('route' => 'route.name', 'method' => 'POST')) !!}
	<ul>
		<li>
			{!! Form::label('soft_product_code', 'Soft_product_code:') !!}
			{!! Form::text('soft_product_code') !!}
		</li>
		<li>
			{!! Form::label('soft_product_name', 'Soft_product_name:') !!}
			{!! Form::text('soft_product_name') !!}
		</li>
		<li>
			{!! Form::label('soft_product_type', 'Soft_product_type:') !!}
			{!! Form::text('soft_product_type') !!}
		</li>
		<li>
			{!! Form::label('term_monthly', 'Term_monthly:') !!}
			{!! Form::text('term_monthly') !!}
		</li>
		<li>
			{!! Form::label('term_quarterly', 'Term_quarterly:') !!}
			{!! Form::text('term_quarterly') !!}
		</li>
		<li>
			{!! Form::label('term_semi_yearly', 'Term_semi_yearly:') !!}
			{!! Form::text('term_semi_yearly') !!}
		</li>
		<li>
			{!! Form::submit() !!}
		</li>
	</ul>
{!! Form::close() !!}