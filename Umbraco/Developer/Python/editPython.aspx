<%@ Page ValidateRequest="false" Language="c#" MasterPageFile="../../masterpages/umbracoPage.Master"
    CodeBehind="editPython.aspx.cs" AutoEventWireup="True" Inherits="Umbraco.Web.UI.Umbraco.Developer.Python.EditPython" %>

<%@ Register TagPrefix="cc1" Namespace="umbraco.uicontrols" Assembly="controls" %>
<%@ Register TagPrefix="umb" Namespace="ClientDependency.Core.Controls" Assembly="ClientDependency.Core" %>

<asp:Content ID="DocTypeContent" ContentPlaceHolderID="DocType" runat="server">
    <!DOCTYPE html>
</asp:Content>

<asp:Content ID="cp0" runat="server" ContentPlaceHolderID="head">
    
    <umb:JsInclude ID="JsInclude2" runat="server" FilePath="Editors/EditMacroScripts.js" PathNameAlias="UmbracoClient" />

    <script type="text/javascript">
        
        (function ($) {
            $(document).ready(function () {
                var editor = new Umbraco.Editors.EditMacroScripts({
                    nameTxtBox: $('#<%= pythonFileName.ClientID %>'),
                    originalFileName: '<%= pythonFileName.Text %>',
                    saveButton: $("#<%= ((Control)SaveButton).ClientID %>"),
                    editorSourceElement: $('#<%= pythonFileName.ClientID %>'),
                    skipTestingCheckBox: $("#<%= SkipTesting.ClientID %>"),
                });
                editor.init();

                //bind save shortcut
                UmbClientMgr.appActions().bindSaveShortCut();
            });
        })(jQuery);
        
    </script>
</asp:Content>
<asp:Content ID="cp1" runat="server" ContentPlaceHolderID="body">
    <cc1:UmbracoPanel ID="UmbracoPanel1" runat="server" Text="Edit scripting file" Height="300"
        Width="600">
        <cc1:Pane ID="Pane1" runat="server" Style="margin-bottom: 10px;">
            <cc1:PropertyPanel ID="pp_filename" Text="Filename" runat="server">
                <asp:TextBox ID="pythonFileName" runat="server" Width="400" CssClass="guiInputText"></asp:TextBox>
            </cc1:PropertyPanel>
            <cc1:PropertyPanel ID="pp_testing" runat="server" Text="Skip testing (ignore errors)">
                <asp:CheckBox ID="SkipTesting" runat="server"></asp:CheckBox>
            </cc1:PropertyPanel>
            <cc1:PropertyPanel ID="pp_errorMsg" runat="server">
                <div id="errorDiv" style="position: relative; display: none;" class="error">
                    -</div>
            </cc1:PropertyPanel>
            <cc1:CodeArea ID="pythonSource" ClientSaveMethod="doSubmit" AutoSuggest="true"  CodeBase="Razor" AutoResize="true" OffSetX="47"
                OffSetY="55" runat="server" />
        </cc1:Pane>
    </cc1:UmbracoPanel>
</asp:Content>
