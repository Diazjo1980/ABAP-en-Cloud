@AbapCatalog.sqlViewName: 'ZV_CLNT_LIB2596L'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Ventas'
define view ZC_CLNT_LIB_2596
  as select from ztb_clnt_lib2596

{

      // Ventas
  key id_libro,
      count(distinct id_cliente) as Ventas 

}
group by
  id_libro
