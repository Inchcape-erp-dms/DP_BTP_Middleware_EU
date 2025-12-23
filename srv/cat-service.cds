// -----------------------------------------------------------
// 1. IMPORTACIONES
// -----------------------------------------------------------

using { ZLTDBM_UTILITARIO_SRV as utilitario } from './external/ZLTDBM_UTILITARIO_SRV';
using { ZLTDBM_CONCESIONARIO_SRV as concesionario } from './external/ZLTDBM_CONCESIONARIO_SRV';
using { ZLTDBM_REPUESTOS_SRV as repuestos } from './external/ZLTDBM_REPUESTOS_SRV';
using { ZLTDBM_VEHICULOS_SRV as vehiculos } from './external/ZLTDBM_VEHICULOS_SRV';

// -----------------------------------------------------------
// 2. SERVICIO DE REPUESTOS
// Ruta exacta del servicio de Repuestos en el Backend
// -----------------------------------------------------------
@path: '/sap/opu/odata/sap/ZLTDBM_REPUESTOS_SRV'

service RepuestosService {

    // --- ENTIDADES (EntitySets) ---
    @readonly entity ADJUNTOSet as projection on repuestos.ADJUNTOSet;
    @readonly entity BUSINESSPLANSet as projection on repuestos.BUSINESSPLANSet;
    @readonly entity BUSINESSPLAN_CABSet as projection on repuestos.BUSINESSPLAN_CABSet;
    @readonly entity CADENA_REEMPLAZOSet as projection on repuestos.CADENA_REEMPLAZOSet;
    @readonly entity CAMPOS_OBLIGATORIOSSet as projection on repuestos.CAMPOS_OBLIGATORIOSSet;
    @readonly entity CLASE_DOCUMENTO_DEVOLUCIONSet as projection on repuestos.CLASE_DOCUMENTO_DEVOLUCIONSet;
    @readonly entity CLASE_PEDSet as projection on repuestos.CLASE_PEDSet;
    @readonly entity COLUMNAS_DESDE_CLASE_PEDIDOSet as projection on repuestos.COLUMNAS_DESDE_CLASE_PEDIDOSet;
    @readonly entity COND_PAGOSet as projection on repuestos.COND_PAGOSet;
    @readonly entity CONSULTA_FACTURASSet as projection on repuestos.CONSULTA_FACTURASSet;
    @readonly entity CREA_PEDIDO_CABSet as projection on repuestos.CREA_PEDIDO_CABSet;
    @readonly entity CREA_PEDIDO_DETSet as projection on repuestos.CREA_PEDIDO_DETSet;
    @readonly entity DATORGANIZSet as projection on repuestos.DATORGANIZSet;
    @readonly entity datos_pais_marcaSet as projection on repuestos.datos_pais_marcaSet;
    @readonly entity datos_pais_marca_clienteSet as projection on repuestos.datos_pais_marca_clienteSet;
    @readonly entity DEST_MERCANCIASSet as projection on repuestos.DEST_MERCANCIASSet;
    @readonly entity DEVOLUCION_CABSet as projection on repuestos.DEVOLUCION_CABSet;
    @readonly entity DEVOLUCION_DETSet as projection on repuestos.DEVOLUCION_DETSet;
    @readonly entity DISPONIBILIDAD_PRECIOSet as projection on repuestos.DISPONIBILIDAD_PRECIOSet;
    @readonly entity ESTADO_DEVOLUCIONESSet as projection on repuestos.ESTADO_DEVOLUCIONESSet;
    @readonly entity FAMILIA_REPUESTOSSet as projection on repuestos.FAMILIA_REPUESTOSSet;
    @readonly entity FILL_RATESet as projection on repuestos.FILL_RATESet;
    @readonly entity FILL_RATE_DETALLESet as projection on repuestos.FILL_RATE_DETALLESet;
    @readonly entity FILL_RATE_GRAFICOSet as projection on repuestos.FILL_RATE_GRAFICOSet;
    @readonly entity VhStatusTypeSet as projection on repuestos.VhStatusTypeSet;
    @readonly entity TypeDocAttachmentSet as projection on repuestos.TypeDocAttachmentSet;
    @readonly entity check_docSet as projection on repuestos.check_docSet;
    @readonly entity OrderReasonSet as projection on repuestos.OrderReasonSet;
    @readonly entity auartSet as projection on repuestos.auartSet;
    @readonly entity INDICADORES_GESTIONSet as projection on repuestos.INDICADORES_GESTIONSet;
    @readonly entity INDICADORES_GESTION_DETSet as projection on repuestos.INDICADORES_GESTION_DETSet;
    @readonly entity META_FILLRATESet as projection on repuestos.META_FILLRATESet;
    @readonly entity MOT_PEDIDOSSet as projection on repuestos.MOT_PEDIDOSSet;
    @readonly entity MOTIVO_DEVOLUCIONSet as projection on repuestos.MOTIVO_DEVOLUCIONSet;
    @readonly entity MOTIVO_RECHAZOSet as projection on repuestos.MOTIVO_RECHAZOSet;
    @readonly entity NPFSet as projection on repuestos.NPFSet;
    @readonly entity PEDIDO_ADJUNTOSet as projection on repuestos.PEDIDO_ADJUNTOSet;
    @readonly entity PEDIDOS_BACKORDERSet as projection on repuestos.PEDIDOS_BACKORDERSet;
    @readonly entity PEDIDOS_BACKORDER_REPARTOSSet as projection on repuestos.PEDIDOS_BACKORDER_REPARTOSSet;
    @readonly entity POS_PENDIENTESSet as projection on repuestos.POS_PENDIENTESSet;
    @readonly entity RATIOSSet as projection on repuestos.RATIOSSet;
    @readonly entity RESUMEN_CREDITOSet as projection on repuestos.RESUMEN_CREDITOSet;
    @readonly entity SEGUIMIENTO_DEVOLUCIONSet as projection on repuestos.SEGUIMIENTO_DEVOLUCIONSet;
    @readonly entity SEGUIMIENTO_PEDIDOSSet as projection on repuestos.SEGUIMIENTO_PEDIDOSSet;
    @readonly entity VENTA_FALLIDASet as projection on repuestos.VENTA_FALLIDASet;
    @readonly entity AvailabilityPricesPartsSet as projection on repuestos.AvailabilityPricesPartsSet;
    @readonly entity DISCOUNT_REQ_ORDERSSet as projection on repuestos.DISCOUNT_REQ_ORDERSSet;
    @readonly entity Discount_REQ_STATUSSet as projection on repuestos.Discount_REQ_STATUSSet;
    @readonly entity OrderTypeSet as projection on repuestos.OrderTypeSet;
    @readonly entity ProductSet as projection on repuestos.ProductSet;
    @readonly entity CREATE_ORDER_AVPRSet as projection on repuestos.CREATE_ORDER_AVPRSet;
    @readonly entity CabecerapedidotoadjuntoSet as projection on repuestos.CabecerapedidotoadjuntoSet;
    @readonly entity CabeceratoventafallidaSet as projection on repuestos.CabeceratoventafallidaSet;
    @readonly entity CreaPedidoDetsetSet as projection on repuestos.CreaPedidoDetsetSet;
    @readonly entity ZhsDiscountProgramsSet as projection on repuestos.ZhsDiscountProgramsSet;
    @readonly entity DISCOUNT_REQUESTSet as projection on repuestos.DISCOUNT_REQUESTSet;
    @readonly entity PartnerSet as projection on repuestos.PartnerSet;
    @readonly entity F4HelpVhcleESet as projection on repuestos.F4HelpVhcleESet;
    @readonly entity Order_discountRequestSet as projection on repuestos.Order_discountRequestSet;
    @readonly entity AvailabilityTrafficlLightSet as projection on repuestos.AvailabilityTrafficlLightSet;
    @readonly entity AV_PR_STOCK_DISCSet as projection on repuestos.AV_PR_STOCK_DISCSet;
    @readonly entity ItemsDiscSet as projection on repuestos.ItemsDiscSet;

    // --- FUNCTION IMPORTS ---
    function GetShippedToParty(Kunnr: String(10), Land1: String(3), Bukrs: String(4), Spart: String(3)) returns array of PartnerSet;
    function GetSoldToParty(Kunnr: String(10), Land1: String(3), Bukrs: String(4), Spart: String(3)) returns array of PartnerSet;
    function GetOrderType(Bukrs: String, Spart: String, Land1: String(4)) returns array of OrderTypeSet;
    function GetOrderReasons(Land1: String(3), Bukrs: String(4), Spart: String(3)) returns array of OrderReasonSet;
    function GetBilledToParty(Spart: String(3), Bukrs: String(4), Kunnr: String(10), Land1: String(3)) returns array of PartnerSet;
}



// -----------------------------------------------------------
// 3. SERVICIO DE UTILITARIOS
// Ruta exacta del servicio de Utilitarios en el Backend
// ----------------------------------------------------------

@path: '/sap/opu/odata/sap/ZLTDBM_UTILITARIO_SRV'
service UtilitarioService @(requires: 'any') {

 @readonly entity CustContrDateSet as projection on utilitario.CustContrDateSet;
    @readonly entity areaVentasUsuarioSet as projection on utilitario.areaVentasUsuarioSet;
    @readonly entity ColorExternoSet as projection on utilitario.ColorExternoSet;
    @readonly entity DealerSet as projection on utilitario.DealerSet;
    @readonly entity Delete_documentosDPSet as projection on utilitario.Delete_documentosDPSet;
    @readonly entity DestinatariosClienteSet as projection on utilitario.DestinatariosClienteSet;
    @readonly entity DestinatariosMercanciaSet as projection on utilitario.DestinatariosMercanciaSet;
    @readonly entity DocumentosDPSet as projection on utilitario.DocumentosDPSet;
    @readonly entity EnviarCorreosGCSet as projection on utilitario.EnviarCorreosGCSet;
    @readonly entity Estatus_pedidoSet as projection on utilitario.Estatus_pedidoSet;
    @readonly entity GET_MODEL_CODESet as projection on utilitario.GET_MODEL_CODESet;
    @readonly entity GET_MONTHSet as projection on utilitario.GET_MONTHSet;
    @readonly entity MaestroAplicacionesSet as projection on utilitario.MaestroAplicacionesSet;
    @readonly entity MARCA_POR_URL_PORTALSet as projection on utilitario.MARCA_POR_URL_PORTALSet;
    @readonly entity ModelosSet as projection on utilitario.ModelosSet;
    @readonly entity SistemasDestinoSet as projection on utilitario.SistemasDestinoSet;
    @readonly entity Stock_typeSet as projection on utilitario.Stock_typeSet;
    @readonly entity ZshdpLineupSet as projection on utilitario.ZshdpLineupSet;
    @readonly entity ZshAuartSet as projection on utilitario.ZshAuartSet;
    @readonly entity ZshfkartSet as projection on utilitario.ZshfkartSet;
    @readonly entity PDFSet as projection on utilitario.PDFSet;
    @readonly entity OrderReasonSet as projection on utilitario.OrderReasonSet;
    @readonly entity RejectionReasonSet as projection on utilitario.RejectionReasonSet;
    @readonly entity CommonOrderTypeSet as projection on utilitario.CommonOrderTypeSet;
    @readonly entity CommonTypeofSaleSet as projection on utilitario.CommonTypeofSaleSet;
    @readonly entity SalesDocumentTypeSet as projection on utilitario.SalesDocumentTypeSet;
    @readonly entity GetTransmissionSet as projection on utilitario.GetTransmissionSet;
    @readonly entity GetBodySet as projection on utilitario.GetBodySet;
    @readonly entity Model_Confi_vehicleSet as projection on utilitario.Model_Confi_vehicleSet;
    @readonly entity ValueFidexUserSet as projection on utilitario.ValueFidexUserSet;
    @readonly entity ZshExtclrSet as projection on utilitario.ZshExtclrSet;
    @readonly entity BrandSet as projection on utilitario.BrandSet;
    @readonly entity ZshSalesSetSet as projection on utilitario.ZshSalesSetSet;
    @readonly entity IntVehicleNoSet as projection on utilitario.IntVehicleNoSet;
    @readonly entity ExtVehicleNoSet as projection on utilitario.ExtVehicleNoSet;
    @readonly entity VehicleIdNoSet as projection on utilitario.VehicleIdNoSet;
    @readonly entity GetLineupIdSet as projection on utilitario.GetLineupIdSet;
    @readonly entity GetModelYearSet as projection on utilitario.GetModelYearSet;
    @readonly entity GetVersionSet as projection on utilitario.GetVersionSet;
    @readonly entity GetEngineSet as projection on utilitario.GetEngineSet;
    @readonly entity DocumentStatusSet as projection on utilitario.DocumentStatusSet;
    @readonly entity ZSHVHVINSet as projection on utilitario.ZSHVHVINSet;
    @readonly entity AvailabilitySet as projection on utilitario.AvailabilitySet;
    @readonly entity SH_REG_STATSet as projection on utilitario.SH_REG_STATSet;
    @readonly entity SH_DOCTYPE_AVPRSet as projection on utilitario.SH_DOCTYPE_AVPRSet;
    @readonly entity GetOptionalFeaturesSet as projection on utilitario.GetOptionalFeaturesSet;
    @readonly entity GetOptionalFeaturesResultSet as projection on utilitario.GetOptionalFeaturesResultSet;
    @readonly entity SDocumentType_bybukrsSet as projection on utilitario.SDocumentType_bybukrsSet;
    @readonly entity ZshIntcolorDpSet as projection on utilitario.ZshIntcolorDpSet;
    @readonly entity DownloadFilesSet as projection on utilitario.DownloadFilesSet;
}


// -----------------------------------------------------------
// 4. SERVICIO DE VEHICULOS
// -----------------------------------------------------------
@path: '/sap/opu/odata/sap/ZLTDBM_VEHICULOS_SRV'
service VehiculosService @(requires: 'any') {

    // --- Entidades de Vehículos ---
  @readonly entity ZSH_DELIVERY_DEALERSSet as projection on vehiculos.ZSH_DELIVERY_DEALERSSet;
    @readonly entity CREA_OFERTA_CABSet as projection on vehiculos.CREA_OFERTA_CABSet;
    @readonly entity Details_disponibilidad_precSet as projection on vehiculos.Details_disponibilidad_precSet;
    @readonly entity Vehicle_colorsSet as projection on vehiculos.Vehicle_colorsSet;
    @readonly entity CREDIT_LIMIT_TYPESet as projection on vehiculos.CREDIT_LIMIT_TYPESet;
    @readonly entity VEHICLE_USAGESet as projection on vehiculos.VEHICLE_USAGESet;
    @readonly entity ZSH_REGSTATUSSet as projection on vehiculos.ZSH_REGSTATUSSet;
    @readonly entity BUSINESSPLANSet as projection on vehiculos.BUSINESSPLANSet;
    @readonly entity BUSINESSPLAN_CABSet as projection on vehiculos.BUSINESSPLAN_CABSet;
    @readonly entity CREA_OFERTA_DETSet as projection on vehiculos.CREA_OFERTA_DETSet;
    @readonly entity CREA_PEDIDO_CABSet as projection on vehiculos.CREA_PEDIDO_CABSet;
    @readonly entity CREA_PEDIDO_DETSet as projection on vehiculos.CREA_PEDIDO_DETSet;
    @readonly entity INIDICADORES_GESTIONSet as projection on vehiculos.INIDICADORES_GESTIONSet;
    @readonly entity INIDICADORES_GESTION_DETSet as projection on vehiculos.INIDICADORES_GESTION_DETSet;
    @readonly entity MASIVO_CAB_FEDSet as projection on vehiculos.MASIVO_CAB_FEDSet;
    @readonly entity MASIVO_DET_FEDSet as projection on vehiculos.MASIVO_DET_FEDSet;
    @readonly entity RESUMEN_CREDITOSet as projection on vehiculos.RESUMEN_CREDITOSet;
    @readonly entity SEGUIMIENTO_PEDIDOSVHSet as projection on vehiculos.SEGUIMIENTO_PEDIDOSVHSet;
    @readonly entity SEGUIMIENTO_SOLICITUDESSet as projection on vehiculos.SEGUIMIENTO_SOLICITUDESSet;
    @readonly entity UBICACIONSet as projection on vehiculos.UBICACIONSet;
    @readonly entity UNIDADES_ASIGNADASSet as projection on vehiculos.UNIDADES_ASIGNADASSet;
    @readonly entity Vehicle_CLientSet as projection on vehiculos.Vehicle_CLientSet;
    @readonly entity Vehicle_Client_detailSet as projection on vehiculos.Vehicle_Client_detailSet;
    @readonly entity DISPONIBILIDAD_PRECIOSet as projection on vehiculos.DISPONIBILIDAD_PRECIOSet;
    @readonly entity SO_OPTSet as projection on vehiculos.SO_OPTSet;
    @readonly entity AVAIL_PRICES_MTSet as projection on vehiculos.AVAIL_PRICES_MTSet;
    @readonly entity EXECUTE_YRECSet as projection on vehiculos.EXECUTE_YRECSet;
    @readonly entity CREATE_ORDER_YORCSet as projection on vehiculos.CREATE_ORDER_YORCSet;
    @readonly entity OEMModelSet as projection on vehiculos.OEMModelSet;
    @readonly entity LEAD_MANAGEMENTCABSet as projection on vehiculos.LEAD_MANAGEMENTCABSet;
    @readonly entity LEAD_MANAGEMENTCAB001Set as projection on vehiculos.LEAD_MANAGEMENTCAB001Set;
    @readonly entity ZSH_GROUP_LEADMGTSet as projection on vehiculos.ZSH_GROUP_LEADMGTSet;
    @readonly entity ZSH_RPTTYPE_LEADMGTSet as projection on vehiculos.ZSH_RPTTYPE_LEADMGTSet;
    @readonly entity ZSH_SITE_LEADMGTSet as projection on vehiculos.ZSH_SITE_LEADMGTSet;
    @readonly entity ZSH_UPLTYPE_LEADMGTSet as projection on vehiculos.ZSH_UPLTYPE_LEADMGTSet;
    @readonly entity ILM_TEMPLATESet as projection on vehiculos.ILM_TEMPLATESet;
    @readonly entity IlmTemplatePosSet as projection on vehiculos.IlmTemplatePosSet;
    @readonly entity CREATE_OFFER_MTSet as projection on vehiculos.CREATE_OFFER_MTSet;
    @readonly entity CANCEL_RESVSet as projection on vehiculos.CANCEL_RESVSet;
    @readonly entity ILM_MAILSet as projection on vehiculos.ILM_MAILSet;
    @readonly entity ReportSet as projection on vehiculos.ReportSet;
    @readonly entity ModSalesOrderSet as projection on vehiculos.ModSalesOrderSet;
    @readonly entity ModDealerAdditionalTextSet as projection on vehiculos.ModDealerAdditionalTextSet;
    @readonly entity ModDistInternalTextSet as projection on vehiculos.ModDistInternalTextSet;
    @readonly entity CREATE_BACKORDERSet as projection on vehiculos.CREATE_BACKORDERSet;
    @readonly entity VehicleHandoverSecondSet as projection on vehiculos.VehicleHandoverSecondSet;
}
// -----------------------------------------------------------
// 5. SERVICIO DE CONCESIONARIO
// -----------------------------------------------------------
@path: '/sap/opu/odata/sap/ZLTDBM_CONCESIONARIO_SRV'
service ConcesionarioService @(requires: 'any') {

    // --- Entidades de Concesionario (Excluyendo Dealer y Brand) ---
 
    // --- Entidades Relacionadas ---
    @readonly entity SUCURSALSet as projection on concesionario.SUCURSALSet;
    @readonly entity CONTACTOSet as projection on concesionario.CONTACTOSet;

    // Resto de Entidades Maestras y de Consulta
    @readonly entity DealerSet as projection on concesionario.DealerSet;
    @readonly entity CONSULTA_FACTURASSet as projection on concesionario.CONSULTA_FACTURASSet;
    @readonly entity ESTATUS_PEDIDOS_VORSet as projection on concesionario.ESTATUS_PEDIDOS_VORSet;
    @readonly entity FACTURASet as projection on concesionario.FACTURASet;
    @readonly entity materialreemplazoSet as projection on concesionario.materialreemplazoSet;
    @readonly entity PDFSet as projection on concesionario.PDFSet;
    @readonly entity PEDIDOS_BACKORDERSet as projection on concesionario.PEDIDOS_BACKORDERSet;
    @readonly entity RED_CONCECIONARIOSSet as projection on concesionario.RED_CONCECIONARIOSSet;
    @readonly entity SEGUIMIENTO_PEDIDOSSet as projection on concesionario.SEGUIMIENTO_PEDIDOSSet;
    @readonly entity USUARIOS_AUTORIZADOSSet as projection on concesionario.USUARIOS_AUTORIZADOSSet;
    @readonly entity LeadManagementSet as projection on concesionario.LeadManagementSet;
    @readonly entity INVOICESet as projection on concesionario.INVOICESet;
    @readonly entity LEAD_MANAGEMENTSet as projection on concesionario.LEAD_MANAGEMENTSet;
}
