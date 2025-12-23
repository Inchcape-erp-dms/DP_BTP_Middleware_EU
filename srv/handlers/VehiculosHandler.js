const cds = require('@sap/cds');

module.exports = async (srv) => {

    // 1. Conectar al servicio externo
    const ZVehiculosService = await cds.connect.to('ZLTDBM_VEHICULOS_SRV');

    // 2. Lista maestra de entidades (EntitySets)
    const vehiculosEntities = [
        'ZSH_DELIVERY_DEALERSSet', 'CREA_OFERTA_CABSet', 'Details_disponibilidad_precSet',
        'Vehicle_colorsSet', 'CREDIT_LIMIT_TYPESet', 'VEHICLE_USAGESet', 'ZSH_REGSTATUSSet',
        'BUSINESSPLANSet', 'BUSINESSPLAN_CABSet', 'CREA_OFERTA_DETSet', 'CREA_PEDIDO_CABSet',
        'CREA_PEDIDO_DETSet', 'INIDICADORES_GESTIONSet', 'INIDICADORES_GESTION_DETSet',
        'ITEMSSet', 'MASIVO_CAB_FEDSet', 'MASIVO_DET_FEDSet', 'RESUMEN_CREDITOSet',
        'SEGUIMIENTO_PEDIDOSVHSet', 'SEGUIMIENTO_SOLICITUDESSet', 'UBICACIONSet',
        'UNIDADES_ASIGNADASSet', 'Vehicle_CLientSet', 'Vehicle_Client_detailSet',
        'DISPONIBILIDAD_PRECIOSet', 'SO_OPTSet', 'AVAIL_PRICES_MTSet', 'EXECUTE_YRECSet',
        'CREATE_ORDER_YORCSet', 'OEMModelSet', 'LEAD_MANAGEMENTCABSet', 'LEAD_MANAGEMENTCAB001Set',
        'ZSH_GROUP_LEADMGTSet', 'ZSH_RPTTYPE_LEADMGTSet', 'ZSH_SITE_LEADMGTSet',
        'ZSH_UPLTYPE_LEADMGTSet', 'IL_TEMPLATESet', 'IlmTemplatePosSet', 'CREATE_OFFER_MTSet',
        'CANCEL_RESVSet', 'ILM_MAILSet', 'ReportSet', 'ModSalesOrderSet', 
        'ModDealerAdditionalTextSet', 'ModDistInternalTextSet', 'CREATE_BACKORDERSet',
        'VehicleHandoverSecondSet'
    ];

    // 3. Registro Dinámico de Handlers (READ para Tablas)
    vehiculosEntities.forEach(entityName => {
        srv.on('READ', entityName, async (req) => {
            try {
                return await ZVehiculosService.tx(req).run(req.query);
            } catch (error) {
                console.error(`Error en Vehiculos - ${entityName}:`, error.message);
                req.error(500, `Error en ${entityName}: ` + error.message);
            }
        });
    });

    // 4. Handlers para Function Imports
    // Se delegan directamente usando la transacción.
    srv.on('GetShippedToParty', async (req) => {
        return await ZVehiculosService.tx(req).run(req.query);
    });

    srv.on('GetShippedToPartyRS', async (req) => {
        return await ZVehiculosService.tx(req).run(req.query);
    });

    console.log(` Handlers registrados para ${vehiculosEntities.length} entidades de Vehículos.`);
};