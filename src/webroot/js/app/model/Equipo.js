Ext.define('labinfsis.model.Equipo', {
    extend: 'Ext.data.Model',
    fields: [{
        name:'id',
        type: 'int',
        mapping: 'id'
    },
    'estado_id',
    'categoria_id',
    'nombre_estado',
    'nia',
    'codigo',
    'nombre_equipo',
    'descripcion_equipo',
    {
        name:'disponible',
        type:'bool',
        mapping: 'disponible'
    }
    ]
});