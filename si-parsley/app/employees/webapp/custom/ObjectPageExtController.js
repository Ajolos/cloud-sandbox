sap.ui.define([],
function (){
    "use strict";
    var extensionAPI;
    var that =  {
        callCommentDialog: function(oContext) {
            extensionAPI = this;
            if(!that.commentDialog){
                this.loadFragment({
                    name: "pl.sic.parsley.employees.custom.fragments.CommentDialog",
                    contextPath: oContext.getPath(),
                    controller: that
                }).then(function(dialog){
                    that.commentDialog = dialog;
                    this.addDependent(that.commentDialog);
                    that.commentDialog.open();
                }.bind(this));
            }else{
                that.commentDialog.getBindingContext().setProperty("$Parameter/rating",0);
                that.commentDialog.getBindingContext().setProperty("$Parameter/content","");
                that.commentDialog.open();
            }
        },

        commentConfirmPress: function(oEvent){
            that.commentDialog.getObjectBinding().execute().then((r) => {
                that.commentDialog.close();
                extensionAPI.getBindingContext().refresh();
            });
        },

        commentCancelPress: function(oEvent){
            that.commentDialog.close();
        }
    };
    return that;
});
