{!! Form::open(array('route' => 'route.name', 'method' => 'POST')) !!}
	<ul>
		<li>
			{!! Form::label('username', 'Username:') !!}
			{!! Form::text('username') !!}
		</li>
		<li>
			{!! Form::label('first_name', 'First_name:') !!}
			{!! Form::text('first_name') !!}
		</li>
		<li>
			{!! Form::label('last_name', 'Last_name:') !!}
			{!! Form::text('last_name') !!}
		</li>
		<li>
			{!! Form::label('address1', 'Address1:') !!}
			{!! Form::text('address1') !!}
		</li>
		<li>
			{!! Form::label('address2', 'Address2:') !!}
			{!! Form::text('address2') !!}
		</li>
		<li>
			{!! Form::label('address3', 'Address3:') !!}
			{!! Form::text('address3') !!}
		</li>
		<li>
			{!! Form::label('state', 'State:') !!}
			{!! Form::text('state') !!}
		</li>
		<li>
			{!! Form::label('zip', 'Zip:') !!}
			{!! Form::text('zip') !!}
		</li>
		<li>
			{!! Form::label('phone', 'Phone:') !!}
			{!! Form::text('phone') !!}
		</li>
		<li>
			{!! Form::label('mobile', 'Mobile:') !!}
			{!! Form::text('mobile') !!}
		</li>
		<li>
			{!! Form::label('email', 'Email:') !!}
			{!! Form::text('email') !!}
		</li>
		<li>
			{!! Form::label('password', 'Password:') !!}
			{!! Form::text('password') !!}
		</li>
		<li>
			{!! Form::submit() !!}
		</li>
	</ul>
{!! Form::close() !!}