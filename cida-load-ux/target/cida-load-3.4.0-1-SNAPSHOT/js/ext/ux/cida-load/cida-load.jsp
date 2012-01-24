<link rel="stylesheet" type="text/css" href="js/ext/ux/cida-load/cida-load.css" />
<script type="text/javascript">
    var LOADMASK;
    function initializeLoadMask() {
        LOADMASK = new Ext.LoadMask(Ext.getBody(), {
            msg: '<div id="cida-load-msg">Loading...</div><img width="300" height="161" src="js/ext/ux/cida-load/cida-anim.gif" />', 
            msgCls: 'cida-load'
        });
    }
</script>
