const cds = require('@sap/cds');

module.exports = async (srv) => {

    // 1. Conectar al servicio externo
   const ZConcesionarioService = await cds.connect.to('ZLTDBM_CONCESIONARIO_SRV');

    // 2. Lista maestra de entidades del servicio CONCESIONARIO
    const concesionarioEntities = [
        'DATOS_BASIC_CONTACTSet', 'SUCURSALSet', 'CONTACTOSet', 'DealerSet',
        'CONSULTA_FACTURASSet', 'ESTATUS_PEDIDOS_VORSet', 'FACTURASet',
        'materialreemplazoSet', 'PDFSet', 'PEDIDOS_BACKORDERSet',
        'RED_CONCECIONARIOSSet', 'SEGUIMIENTO_PEDIDOSSet',
        'USUARIOS_AUTORIZADOSSet', 'LeadManagementSet', 'INVOICESet',
        'LEAD_MANAGEMENTSet'
    ];
    // 3. Registro Dinámico de Handlers (READ para Tablas)
    concesionarioEntities.forEach(entityName => {
        srv.on('READ', entityName, async (req) => {
            try {
                return await ZConcesionarioService.tx(req).run(req.query);
            } catch (error) {
                console.error(`Error en Vehiculos - ${entityName}:`, error.message);
                req.error(500, `Error en ${entityName}: ` + error.message);
            }
        });
    });

    // 4. Handlers para Function Imports
    // Se delegan directamente usando la transacción.
   

    console.log(` Handlers registrados para ${concesionarioEntities.length} entidades de Vehículos.`);
};