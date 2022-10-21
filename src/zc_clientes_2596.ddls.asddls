@AbapCatalog.sqlViewName: 'ZV_CLIENTESL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Clientes'
@Metadata.allowExtensions: true
@UI.headerInfo: { typeName    : 'Cliente',
                  title       : {type : #STANDARD,
                                 value: 'NombreCompleto'},
                  description : {type : #STANDARD,
                                 value: 'IdCliente'},
                  imageUrl    : 'Imagen'}
define view ZC_CLIENTES_2596
  as select from ztb_clientes2596 as clientes
    inner join   ztb_clnt_lib2596 as clnts on clientes.id_cliente = clnts.id_cliente
{

      // clnts
  key clnts.id_libro                                            as IdLibro,

      // Libros
  key clientes.id_cliente                                       as IdCliente,
  key clientes.tipo_acceso                                      as Acceso,
      clientes.nombre                                           as Nombre,
      clientes.apellidos                                        as Apellido,
      clientes.email                                            as Email,
      clientes.url                                              as Imagen,
      concat_with_space(clientes.nombre, clientes.apellidos, 1) as NombreCompleto
}
