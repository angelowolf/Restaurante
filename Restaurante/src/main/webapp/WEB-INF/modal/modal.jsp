<%@taglib uri="/struts-tags" prefix="s"%>
<div id="<s:property value="modalId"/>" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-dialog-center">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"><s:property value="titulo"/></h4>
            </div>
            <div class="modal-body">
                <input id="model" type="hidden" value="<s:property value="modelo"/>"/>
                <input id="model-id" type="hidden" value=""/>
                <p><s:property value="mensaje"/></p>
            </div>
            <div class="modal-footer">
                <div class="row">
                    <div class="col-xs-6 text-left">
                        <button class="btn btn-default cancelar" data-dismiss="modal">
                            Cancelar
                        </button>
                    </div>
                    <div class="col-xs-6 text-right">
                        <button class="btn btn-warning confirmar">
                            Aceptar
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
