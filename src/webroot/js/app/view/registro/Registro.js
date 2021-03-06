Ext.define('labinfsis.view.registro.Registro' ,{
    extend: 'Ext.panel.Panel',
    alias : 'widget.registros',
    requires:['Ext.ux.DataView.Animated'],
    layout: 'fit',
    autoShow: true,
    modal: true,       
    initComponent: function() {        
        this.items=[
        Ext.create('Ext.view.View', {
            deferInitialRefresh: false,
            store: Ext.data.StoreManager.lookup('EquiposIngresos'),
            tpl  : Ext.create('Ext.XTemplate',
                '<tpl for=".">',
                '<div class="item">',
                (!Ext.isIE6? '<img width="64" height="64" src="/img/computer-64x64.png" />' :
                    '<div style="width:74px;height:74px;filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src=\'img/computer-64x64.png\',sizingMethod=\'scale\')"></div>'),
                '<strong>{nombre_equipo}</strong>',
                '<strong>{nombre_estado}</strong>',
                '<span>{disponible}</span>',
                '</div>',
                '</tpl>'
                ),

            plugins : [
            Ext.create('Ext.ux.DataView.Animated', {
                duration  : 550,
                idProperty: 'id'
            })
            ],
            id: 'items',

            itemSelector: 'div.item',
            overItemCls : 'item-hover',
            multiSelect : true,
            autoScroll  : true
        })

        ],
        this.tbar=[{
            title:'Session',
            xtype:'buttongroup',
            columns:2,
            items:[{                
                iconCls: 'icon-user-administrator-32x32',
                scale:'large',
                rowspan:4,
                arrowAlign: 'bottom',
                menu:{
                    xtype: 'menu',
                    style: {
                        overflow: 'visible'     // For the Combo popup
                    },
                    items:[{
                            text:'Configuracion',
                            menu:{
                                items:[{
                                        text:'Laboratorios',
                                        handler: function(){
                                            Ext.widget('laboratorios');
                                        }
                                },{
                                        text:'Equipos',
                                        handler: function(){
                                            Ext.widget('equipos');
                                        }
                                },{
                                        text:'Cursos'
                                },'-',{
                                    text:'Estados',
                                    handler: function(){
                                        Ext.widget('estados');
                                    }
                                },{
                                    text:'Fabricantes',
                                    handler: function(){
                                        Ext.widget('fabricantes');
                                    }
                                },{
                                    text:'Categorias',
                                    handler: function(){
                                        Ext.widget('categorias');
                                    }
                                }]
                            }
                    },{
                        text:'Informacion Personal'
                    },{
                        text:'Cambiar contraseña'
                    },{
                        text:'Salir',
                        iconCls:'icon-cancel-16x16'
                    }]
                }
               
            },{
                xtype: 'tbtext',
                text:'<b> Usuario: <span style="color:#c00;">Edner Elvis Cáceres Lazo</span></b>'
            },{
                xtype: 'tbtext',
                text:'<b>Rol: Administrador</b>'
            },{
                xtype: 'tbseparator', 
                height:5
            },{                    
                xtype:'combo',
                id:'lab-select-tb',
                hideLabel: true,
                store: Ext.data.StoreManager.lookup('Laboratorios'),
                valueField: 'id',
                displayField: 'nombre_laboratorio',
                editable: false,
                queryMode: 'remote',
                triggerAction: 'all',
                value: 1,
                width: 200
            }]
        },{
            title:'Ver',
            xtype:'buttongroup',
            columns:3,
            items:[{
                xtype: 'buttongroup',
                title: 'Estados',
                defaults:{
                    enableToggle: true,
                    scale:'large'
                },
                items:[{
                    text: 'Todos',
                    toggleGroup: 'view',
                    action: 'viewall',
                    iconCls: 'icon-computer-32x32',
                    id:'all'
                },{
                    text: 'Fuera de servicio',
                    toggleGroup: 'view',
                    action: 'viewoutservice',
                    iconCls: 'icon-computer-error-32x32',
                    id: 'outservice'
                },{
                    text: 'Activos',
                    toggleGroup: 'view',
                    action: 'viewactive',
                    iconCls: 'icon-computer-active-32x32',
                    id:'active',
                    pressed: true
                }]
            },{
                xtype: 'buttongroup',
                title:'Disponibilidad',
                id:'filter-a',
                defaults:{
                    enableToggle: true,
                    scale:'large',
                    pressed: true
                },
                items:[{
                    text: 'Disponibles',
                    iconCls: 'icon-computer-free-32x32',
                    action: 'filterfree',
                    id:'filterfree'
                    
                    
                },{
                    toggleGroup: 'filter',
                    text: 'En uso',
                    iconCls: 'icon-computer-busy-32x32',
                    action:'filterused',
                    id:'filterused'
                }]
            }]
        }]
        this.callParent(arguments);
    }

});