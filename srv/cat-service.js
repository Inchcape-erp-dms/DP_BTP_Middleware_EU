const cds = require('@sap/cds');
const proxy = require('@sap/cds-odata-v2-adapter-proxy');

// Importamos los handlers
const registerUtilitarioHandler = require('./handlers/UtilitarioHandler');
const registerConcecionarioHandler = require('./handlers/ConcesionarioHandler');
const registerVehiculosHandler = require('./handlers/VehiculosHandler');
const registerRepuestosHandler = require('./handlers/RepuestosHandler');


module.exports = async (srv) => {

    // ----------------------------------------------------------------
    // 1. Configuración de Bootstrap (Proxy V2)
    // ----------------------------------------------------------------

    cds.on('bootstrap', app => {
        app.use(proxy());
    });

    // ----------------------------------------------------------------
    // 2. MIDDLEWARE DE ENRUTAMIENTO (Cambio de Destino Dinámico)
    // ----------------------------------------------------------------
    srv.before('*', async (req) => {
        
        // A. Validaciones básicas
        if (!req.target || !req.target.name) return;

        // B. Leer parámetro de destino
        const sDestinationId = req._.req.query['sap-system-destination'];

        // C. Lógica de conexión (Solo si hay destino dinámico)
        if (sDestinationId) {
            
            // Usamos la variable que definimos al inicio.
            if (sCurrentExternalService) {
                console.log(`[CAP Gateway]  Servicio: ${srv.name} -> Redirigiendo a ${sCurrentExternalService} en ${sDestinationId}`);
                
                try {
                    req.target.$target = await cds.connect.to(sCurrentExternalService, {
                        destination: sDestinationId
                    });
                } catch (error) {
                    console.error(` Error conectando a ${sDestinationId}:`, error.message);
                }
            } else {
                console.warn(` Atención: El servicio local '${srv.name}' no tiene un servicio externo mapeado en SERVICE_MAP.`);
            }
        }
    });

    // ----------------------------------------------------------------
    // 3. REGISTRO DE HANDLERS (Aquí estaba el error)
    // ----------------------------------------------------------------

    console.log(" Inicializando Middleware CAP y registrando handlers...");

    // Ya estamos dentro de la implementación, así que usamos 'srv' directamente.
    // NO usamos srv.impl(...) aquí.

    // 3. REGISTRO SELECTIVO DE HANDLERS
    // Aquí está la magia: Dependiendo del nombre del servicio que se está cargando,
    // registramos un handler u otro.

    if (srv.name === 'UtilitarioService') {
        await registerUtilitarioHandler(srv);
    }
    
    else if (srv.name === 'ConcesionarioService') {
        console.log("Cargando handlers para Consecionario...");
        await registerConcecionarioHandler(srv);
    }
    else if (srv.name === 'VehiculosService') {
        console.log("Cargando handlers para Vehículos...");
        await registerVehiculosHandler(srv);
    }
    else if (srv.name === 'RepuestosService') {
        await registerRepuestosHandler(srv);
    }
    


    // Manejo global de errores
    srv.on('error', (err, req) => {
        console.error(` Error procesando entidad ${req.entity}:`, err.message);
    });
};