<div class="form-group">
    <label for="rol" name="rol">Rol</label>
    <div class="form-group">
        <label class="checkbox-inline"><input type="checkbox" name="roles" id="rolUsuario" value="<%out.println(Modelo.Rol.Usuario);%>">Responsable de Usuario</label>
        <label class="checkbox-inline"><input type="checkbox" name="roles" id="rolMozo" value="<%out.println(Modelo.Rol.Mozo);%>">Mozo</label>
        <label class="checkbox-inline"><input type="checkbox" name="roles" id="rolCocina" value="<%out.println(Modelo.Rol.Cocina);%>">Responsable de Cocina</label>
        <label class="checkbox-inline"><input type="checkbox" name="roles" id="rolCaja" value="<%out.println(Modelo.Rol.Caja);%>">Responsable de Caja</label>
        <label class="checkbox-inline"><input type="checkbox" name="roles" id="rolMesa" value="<%out.println(Modelo.Rol.Mesa);%>">Responsable de Mesa</label>
        <label class="checkbox-inline"><input type="checkbox" name="roles" id="rolStock" value="<%out.println(Modelo.Rol.Stock);%>">Responsable de Stock</label>
    </div>
</div>