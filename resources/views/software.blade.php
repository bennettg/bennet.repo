{!! Form::open(array('route' => 'route.name', 'method' => 'POST')) !!}
	<ul>
		<li>
			{!! Form::label('soft_family', 'Soft_family:') !!}
			{!! Form::text('soft_family') !!}
		</li>
		<li>
			{!! Form::label('soft_type', 'Soft_type:') !!}
			{!! Form::text('soft_type') !!}
		</li>
		<li>
			{!! Form::label('soft_status', 'Soft_status:') !!}
			{!! Form::text('soft_status') !!}
		</li>
		<li>
			{!! Form::label('soft_expire', 'Soft_expire:') !!}
			{!! Form::text('soft_expire') !!}
		</li>
		<li>
			{!! Form::label('soft_reg_device_id', 'Soft_reg_device_id:') !!}
			{!! Form::text('soft_reg_device_id') !!}
		</li>
		<li>
			{!! Form::label('soft_device_nickname', 'Soft_device_nickname:') !!}
			{!! Form::text('soft_device_nickname') !!}
		</li>
		<li>
			{!! Form::label('soft_reg_device_status', 'Soft_reg_device_status:') !!}
			{!! Form::text('soft_reg_device_status') !!}
		</li>
		<li>
			{!! Form::label('soft_activation_code', 'Soft_activation_code:') !!}
			{!! Form::text('soft_activation_code') !!}
		</li>
		<li>
			{!! Form::label('soft_product_key', 'Soft_product_key:') !!}
			{!! Form::text('soft_product_key') !!}
		</li>
		<li>
			{!! Form::label('soft_thumb_id', 'Soft_thumb_id:') !!}
			{!! Form::text('soft_thumb_id') !!}
		</li>
		<li>
			{!! Form::label('soft_authenticated_product', 'Soft_authenticated_product:') !!}
			{!! Form::text('soft_authenticated_product') !!}
		</li>
		<li>
			{!! Form::label('soft_purchase_order', 'Soft_purchase_order:') !!}
			{!! Form::text('soft_purchase_order') !!}
		</li>
		<li>
			{!! Form::label('soft_product', 'Soft_product:') !!}
			{!! Form::text('soft_product') !!}
		</li>
		<li>
			{!! Form::label('soft_purchased_on_off', 'Soft_purchased_on_off:') !!}
			{!! Form::text('soft_purchased_on_off') !!}
		</li>
		<li>
			{!! Form::submit() !!}
		</li>
	</ul>
{!! Form::close() !!}