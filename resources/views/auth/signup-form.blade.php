@if (count($errors) > 0)
    <div class="message-box" style="text-align: left; border-color: #F12828; color: #F12828;font-size: 1.6rem">
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif
<form method="POST" action="{!! url('signup') !!}" id="signup-form" data-parsley-validate>
    <section id="form-section">
        <div class="fields-container" id="name-fields">
            <div class="fields-icon-container"><span class="icon-user"></span></div>
            <div class="compact-input">
                <input name="name" id="frm-name" type="text" value="{{ old('name') }}" placeholder="Nombre" autofocus="" required="" tabindex="1"/>
                <label for="frm-name">Nombre</label>
            </div>
            <div class="compact-input">
                <input name="flastname" id="frm-flastname" type="text" value="{{ old('flastname') }}" placeholder="Apellido Paterno" required="" tabindex="2"/>
                <label for="frm-flastname">Apellido Paterno</label>
            </div>
            <div class="compact-input">
                <input name="mlastname" id="frm-mlastname" type="text" value="{{ old('mlastname') }}" placeholder="Apellido Materno" tabindex="3"/>
                <label for="frm-mlastname">Apellido Materno</label>
            </div>
        </div>
        <div class="fields-container" id="email-fields">
            <div class="fields-icon-container"><span class="icon-mail"></span></div>
            <div class="compact-input">
                <input name="email" id="frm-email" type="email" value="{{ old('email') }}" placeholder="Email" required="" tabindex="4"/>
                <label for="frm-email">Email</label>
            </div>
            <div class="compact-input">
                <input name="emailCheck" id="frm-email-check" value="{{ old('email') }}" type="email" placeholder="Confirme Email" data-parsley-equalto="#frm-email" required="" tabindex="5"/>
                <label for="frm-email-check">Confirme Email</label>
            </div>
        </div>
        <div class="fields-container" id="password-fields">
            <div class="fields-icon-container"><span class="icon-key"></span></div>
            <div class="compact-input">
                <input name="password" id="frm-password" type="password" minlength="6" placeholder="Contraseña" required="" tabindex="6"/>
                <label for="frm-password">Contraseña</label>
            </div>
            <div class="compact-input">
                <input name="passwordCheck" id="frm-password-check" type="password" placeholder="Confirme Contraseña" required="" minlength="6" data-parsley-equalto="#frm-password" tabindex="7"/>
                <label for="frm-password-check">Confirme Contraseña</label>
            </div>
        </div>
        <br>
        <input type="hidden" name="type" id="frm-type" value="{!! $type !!}">
        <div class="fields-container" id="submit-fields">
            <br>
            <button type="submit" class="btn-blue btn-submit">Crear Usuario</button>
        </div>
    </section>
</form>