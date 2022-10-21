@AbapCatalog.sqlViewName: 'ZV_LIBROSL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Libros'
@Search.searchable: true
@Metadata.allowExtensions: true
@UI.headerInfo:{ typeName      : 'Libro',
                 typeNamePlural: 'Libros',
                 title         : {type  : #STANDARD,
                                   value: 'Titulo'},
                 description   : {type  : #STANDARD,
                                   value: 'Autor'},
                 imageUrl: 'Imagen'}
define view ZC_LIBROS_2596
  as select from    ztb_libros_2596  as libros
    inner join      ztb_catego_2596  as categorias on libros.bi_categ = categorias.bi_categ
    left outer join ZC_CLNT_LIB_2596 as ventas     on libros.id_libro = ventas.id_libro
  association [0..*] to ZC_CLIENTES_2596 as _Clientes on $projection.IdLibro = _Clientes.IdLibro
{

      // Libros
  key libros.id_libro        as IdLibro,
      libros.titulo          as Titulo,
      libros.bi_categ        as Categoria,
      libros.autor           as Autor,
      libros.editorial       as Editorial,
      libros.idioma          as Idioma,
      libros.paginas         as Paginas,
      @Semantics.amount.currencyCode: 'moneda'
      libros.precio          as Precio,
      case
      when ventas.Ventas < 1 then 0
      when ventas.Ventas = 1 then 1
      when ventas.Ventas = 2 then 2
      when ventas.Ventas > 2 then 3
      else 0
      end                    as Ventas,
      case ventas.Ventas
      when 0 then ''
      else ''
      end                    as Text,
      @Semantics.currencyCode: true
      libros.moneda          as Moneda,
      libros.formato         as Formato,
      categorias.descripcion as Descripcion,
      libros.url             as Imagen,
      _Clientes
}
