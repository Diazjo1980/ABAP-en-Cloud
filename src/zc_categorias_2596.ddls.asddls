@AbapCatalog.sqlViewName: 'ZV_CATEGORIASL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Categorias'
define view ZC_CATEGORIAS_2596
  as select from ztb_catego_2596 as categorias
{

      // Categorias
  key bi_categ    as BiCateg,
      descripcion as Descripcion
}
