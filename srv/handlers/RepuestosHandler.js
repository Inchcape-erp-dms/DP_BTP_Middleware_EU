const cds = require('@sap/cds');

module.exports = async (srv) => {
    const ZRepuestosService = await cds.connect.to('ZLTDBM_REPUESTOS_SRV');

    const repuestosEntities = [
        'ADJUNTOSet', 'BUSINESSPLANSet', 'BUSINESSPLAN_CABSet', 'CADENA_REEMPLAZOSet', 
        'CAMPOS_OBLIGATORIOSSet', 'CLASE_DOCUMENTO_DEVOLUCIONSet', 'CLASE_PEDSet', 
        'COLUMNAS_DESDE_CLASE_PEDIDOSet', 'COND_PAGOSet', 'CONSULTA_FACTURASSet', 
        'CREA_PEDIDO_CABSet', 'CREA_PEDIDO_DETSet', 'DATORGANIZSet', 'datos_pais_marcaSet', 
        'datos_pais_marca_clienteSet', 'DEST_MERCANCIASSet', 'DEVOLUCION_CABSet', 
        'DEVOLUCION_DETSet', 'DISPONIBILIDAD_PRECIOSet', 'ESTADO_DEVOLUCIONESSet', 
        'FAMILIA_REPUESTOSSet', 'FILL_RATESet', 'FILL_RATE_DETALLESet', 'FILL_RATE_GRAFICOSet', 
        'VhStatusTypeSet', 'TypeDocAttachmentSet', 'check_docSet', 'OrderReasonSet', 
        'auartSet', 'INDICADORES_GESTIONSet', 'INDICADORES_GESTION_DETSet', 
        'META_FILLRATESet', 'MOT_PEDIDOSSet', 'MOTIVO_DEVOLUCIONSet', 'MOTIVO_RECHAZOSet', 
        'NPFSet', 'PEDIDO_ADJUNTOSet', 'PEDIDOS_BACKORDERSet', 'PEDIDOS_BACKORDER_REPARTOSSet', 
        'POS_PENDIENTESSet', 'RATIOSSet', 'RESUMEN_CREDITOSet', 'SEGUIMIENTO_DEVOLUCIONSet', 
        'SEGUIMIENTO_PEDIDOSSet', 'VENTA_FALLIDASet', 'AvailabilityPricesPartsSet', 
        'DISCOUNT_REQ_ORDERSSet', 'Discount_REQ_STATUSSet', 'OrderTypeSet', 'ProductSet', 
        'CREATE_ORDER_AVPRSet', 'CabecerapedidotoadjuntoSet', 'CabeceratoventafallidaSet', 
        'CreaPedidoDetsetSet', 'ZhsDiscountProgramsSet', 'DISCOUNT_REQUESTSet', 'PartnerSet', 
        'F4HelpVhcleESet', 'Order_discountRequestSet', 'AvailabilityTrafficlLightSet', 
        'AV_PR_STOCK_DISCSet', 'ItemsDiscSet'
    ];

    // Handler genérico para todas las entidades
    repuestosEntities.forEach(entity => {
        srv.on('READ', entity, async (req) => {
            try {
                return await ZRepuestosService.tx(req).run(req.query);
            } catch (error) {
                console.error(`Error en Repuestos READ [${entity}]:`, error.message);
                req.error(500, `Error en ${entity}: ${error.message}`);
            }
        });
    });

    // Handler para Function Imports
    const functions = ['GetShippedToParty', 'GetSoldToParty', 'GetOrderType', 'GetOrderReasons', 'GetBilledToParty'];
    functions.forEach(fn => {
        srv.on(fn, async (req) => {
            try {
                return await ZRepuestosService.tx(req).run(req.query);
            } catch (error) {
                console.error(`Error en Function [${fn}]:`, error.message);
                req.error(500, `Error al ejecutar ${fn}`);
            }
        });
    });

    console.log(` Repuestos: ${repuestosEntities.length} entidades y ${functions.length} funciones registradas.`);
};