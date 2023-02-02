sap.ui.define([],
function (){
    "use strict";
    var that =  {
        callCommentDialog: function(oContext) {
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
                that.commentDialog.open();
            }
        },

        commentConfirmPress: function(oEvent){
            that.commentDialog.getObjectBinding().execute();
        },

        commentCancelPress: function(oEvent){
            that.commentDialog.close();
        }
    };
    return that;
});
