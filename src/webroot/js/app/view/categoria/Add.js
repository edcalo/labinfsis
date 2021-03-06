Ext.define('labinfsis.view.categoria.Add', {
    extend: 'Ext.window.Window',
    alias : 'widget.addcategoria',
    title : 'Registrar Categoria',
    layout: 'fit',
    autoShow: true,
    modal:true,
    width: 550,
    iconCls: 'icon-add-16x16',
    initComponent: function() {
        this.items = [{
            xtype: 'form',
            border:false,
            bodyStyle: 'padding:10px; background-color:#DFE9F6',
            fieldDefaults: {
                labelAlign: 'top'
            },
            items: [{
                name:'id',
                xtype: 'hidden'
            },{
                name:'categoria_id',
                xtype: 'hidden'
            },{
                xtype: 'textfield',
                name : 'nombre_categoria',
                fieldLabel: 'Nombre de la categoria',
                msgTarget: 'side',
                allowBlank: false,
                anchor:'100%'
            },{
                anchor: '100%',
                xtype: 'htmleditor',                
                name : 'descripcion_categoria',
                fieldLabel: 'Descripcion',
                allowBlank: true,
                height: 200
            }]
        }];

        this.buttons = [{
            text: 'Save',
            action: 'save',
            iconCls:'icon-save-16x16'
        },{
            text: 'Cancel',
            scope: this,
            handler: this.close,
            iconCls:'icon-cancel-16x16'
        }];

        this.callParent(arguments);
    }
});