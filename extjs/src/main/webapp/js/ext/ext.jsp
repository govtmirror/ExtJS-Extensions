
<link rel="stylesheet" type="text/css" href="${param['relPath']}js/ext/resources/css/ext-all.css" />
<script type="text/javascript" src="${param['relPath']}js/ext/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src=""${param['relPath']}js/ext/ext-all${param["debug-qualifier"]}.js"></script>

<script type="text/javascript">
    function initializeQuickTips() {
        Ext.QuickTips.init();

        Ext.apply(Ext.QuickTips.getQuickTip(), {
            maxWidth: 200,
            minWidth: 100,
            showDelay: 50,      // Show 50ms after entering target
            dismissDelay: 0,
            trackMouse: true
        });
    }
</script>