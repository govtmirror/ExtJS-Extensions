
<link rel="stylesheet" type="text/css" href="js/ext/ux/notify/notify.css" />
<script type="text/javascript" src="js/ext/ux/notify/notify.js"></script>

<script type="text/javascript">
    var NOTIFY;
    /**
     * Usage example : 
     *      NOTIFY.error({
     *          msg : 'Message here'
     *      });
     */
    function initializeNotification() {
        LOG.debug('notify.jsp::initializeNotification(): Initializing Notification.');
    
        var defaultConfig = {
            msgWidth: 400,
            hideDelay: 8000
        };
    
        /**
         * ERROR
         */
        var _notifyError = function(args) {
            LOG.trace('notify.jsp:: Showing error popup');
            var config = args || {};
	
            var moreInfo = new Ext.Button({
                text: 'More Info...'
            });
        
            var buttons = [];
            if (config.moreInfoAction) {
                buttons.push(moreInfo);
            }
        
            var notifyError = new Ext.ux.Notify(Ext.applyIf({
                title: 'Error!',
                titleIconCls: 'titleicon-error',
                msgIconCls: 'msgicon-error',
                msg: config.msg || 'An error has occured.',
                buttons: buttons
            }, defaultConfig));
            
            this.notificationWindows.push(notifyError);
            
            if (config.moreInfoAction) {
                moreInfo.on('click', function() {
                    notifyError.hide();
                    config.moreInfoAction();
                });
            }
		
            notifyError.show(document);
        }
	
        /**
         * SUCCESS
         */
        var _notifySuccess = function(msg) {
            LOG.trace('notify.jsp:: Showing success popup');
            new Ext.ux.Notify(Ext.applyIf({
                title: 'Success!',
                titleIconCls: 'titleicon-success',
                msg: msg.msg || 'Data saved successfully.'
            }, defaultConfig)).show(document);
        }
	
        /**
         * DEBUG NOTIFY
         */    
        var _notifyDebug = function(msg) {
            LOG.debug('notify.jsp:: Showing debug popup');
            this.notificationWindows.push(
                new Ext.ux.Notify(Ext.applyIf({
                    title: 'DEBUG',
                    titleIconCls: 'titleicon-debug',
                    msg: msg.msg || ''
                }, defaultConfig)).show(document)
            )
        }
    
        /**
         * WARNING
         */
        var _notifyWarning = function(msg) {
            LOG.debug('notify.jsp:: Showing warning popup');
            this.notificationWindows.push(
                new Ext.ux.Notify(Ext.applyIf({
                    title: 'WARNING',
                    titleIconCls: 'titleicon-warning',
                    msg: msg.msg || ''
                }, defaultConfig)).show(document)
            )
        }
    
        /**
         * INFO
         */
        var _notifyInfo = function(msg) {
            LOG.debug('notify.jsp:: Showing info popup');
            this.notificationWindows.push(
                new Ext.ux.Notify(Ext.applyIf({
                    title: 'INFO',
                    titleIconCls: 'titleicon-info',
                    msg: msg.msg || ''
                }, defaultConfig)).show(document)
            )
        }    
    
        /**
         * Action Required
         */
        var _actionRequired = function(msg) {
            LOG.debug('notify.jsp:: Showing info popup');
            this.notificationWindows.push(
                new Ext.ux.Notify(Ext.apply({
                    title: msg.title || 'Export',
                    titleIconCls: 'titleicon-export',
                    msg: msg.msg || '',
                    //hideDelay: 3600000, // Stick around for an hour
                    isClosable : true,
                    items : msg.items
                }, defaultConfig)).show(document)
            )
        }    
    
        NOTIFY = {
            debug : _notifyDebug,
            success : _notifySuccess,
            error : _notifyError,
            warn : _notifyWarning,
            info : _notifyInfo,
            actionRequired : _actionRequired,
            notificationWindows : [],
            removeAllNotificationWindows : function () {
                while (this.notificationWindows.length > 0) {
                    var notifyWindow = this.notificationWindows.pop();
                    if (typeof notifyWindow.close === 'function') {
                        notifyWindow.close();
                    }
                }
            }
        };
    
        LOG.info('notify.jsp::initializeNotification(): Initialized Notification.');
    }
</script>
