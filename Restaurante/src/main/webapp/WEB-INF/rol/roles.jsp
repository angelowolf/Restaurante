<div class="form-group">
    <label for="rol">Rol</label>
    <div class="form-group">
        <label class="checkbox-inline"><input type="checkbox" name="roles" id="rolAdministrador" value="<%out.println(Modelo.Rol.Administrador);%>">Administrador</label>
        <label class="checkbox-inline"><input type="checkbox" name="roles" id="rolBarra" value="<%out.println(Modelo.Rol.Barra);%>">Barra</label>
        <label class="checkbox-inline"><input type="checkbox" name="roles" id="rolMozo" value="<%out.println(Modelo.Rol.Mozo);%>">Mozo</label>
    </div>
</div>