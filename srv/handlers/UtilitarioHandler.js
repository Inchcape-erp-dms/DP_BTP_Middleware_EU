const cds = require('@sap/cds');

module.exports = async (srv) => {
      
    // 1. Conectamos al servicio externo
    // Asegúrate que el nombre coincida con tu package.json ('ZLTDBM_UTILITARIO_SRV2')
    const ZUtilService = await cds.connect.to('ZLTDBM_UTILITARIO_SRV');
    // 2. Lista de TODAS las entidades de este servicio
    const utilitarioEntities = [
        'CustContrDateSet', 'areaVentasUsuarioSet', 'ColorExternoSet', 'DealerSet',
        'Delete_documentosDPSet', 'DestinatariosClienteSet', 'DestinatariosMercanciaSet',
        'DocumentosDPSet', 'EnviarCorreosGCSet', 'Estatus_pedidoSet', 'GET_MODEL_CODESet',
        'GET_MONTHSet', 'MaestroAplicacionesSet', 'MARCA_POR_URL_PORTALSet', 'ModelosSet',
        'SistemasDestinoSet', 'Stock_typeSet', 'ZshdpLineupSet', 'ZshAuartSet',
        'ZshfkartSet', 'PDFSet', 'OrderReasonSet', 'RejectionReasonSet',
        'CommonOrderTypeSet', 'CommonTypeofSaleSet', 'SalesDocumentTypeSet',
        'GetTransmissionSet', 'GetBodySet', 'Model_Confi_vehicleSet', 'ValueFidexUserSet',
        'ZshExtclrSet', 'BrandSet', 'ZshSalesSetSet', 'IntVehicleNoSet',
        'ExtVehicleNoSet', 'VehicleIdNoSet', 'GetLineupIdSet', 'GetModelYearSet',
        'GetVersionSet', 'GetEngineSet', 'DocumentStatusSet', 'ZSHVHVINSet',
        'AvailabilitySet', 'SH_REG_STATSet', 'SH_DOCTYPE_AVPRSet',
        'GetOptionalFeaturesSet', 'GetOptionalFeaturesResultSet',
        'SDocumentType_bybukrsSet', 'ZshIntcolorDpSet', 'DownloadFilesSet'
    ];

    // 3. Registro Dinámico de Handlers
    utilitarioEntities.forEach(entityName => {
        
        srv.on('READ', entityName, async (req) => {
            try {
                // Delegamos la consulta al backend SAP
                return await ZUtilService.tx(req).run(req.query);
            } catch (error) {
                console.error(`Error en ${entityName}:`, error.message);
                req.error(500, `Error al leer ${entityName}: ` + error.message);
            }
        });

    });

    console.log(` Handlers registrados para ${utilitarioEntities.length} entidades de Utilitario.`);
    // --------------------------------------------------------
    // Manejador para DealerSet
    // --------------------------------------------------------
    srv.on('READ', 'DealerSet', async (req) => {
        try {
            console.log(">> Delegando DealerSet al backend...");
            // Tu middleware en service.js ya inyectó el destino si venía en el query param,
            // así que aquí solo ejecutamos la transacción.
            return await ZUtilService.tx(req).run(req.query);
        } catch (error) {
            req.error(500, "Error en DealerSet: " + error.message);
        }
    });
};

