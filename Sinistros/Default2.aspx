﻿<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="content-type" content="text/html;charset=utf-8" />

    <link type="text/css" href="/Content/css/menu.css" rel="stylesheet" />
    <link type="text/css" href="/Content/css/grid.css" rel="stylesheet" />
    <link type="text/css" href="/Content/css/main.css" rel="stylesheet" />
    <link type="text/css" href="/Content/css/jquery-ui-1.8.22.custom.css" rel="stylesheet" />
    <link type="text/css" href="/Content/css/wizard.css" rel="stylesheet" />    
    <link type="text/css" href="/Content/css/fileupload.main.css" rel="stylesheet" />
    <link type="text/css" href="/Content/css/jquery.fileupload-ui.css" rel="stylesheet" />

    <script src="/Scripts/jquery/jquery-1.7.1.js" type="text/javascript"></script>
    <script src="/Scripts/jquery/jquery.wizard.js" type="text/javascript"></script>
    <script src="/Scripts/jquery/jquery-percent.js" type="text/javascript"></script>
    <script src="/Scripts/jquery/jquery-blockUI.js" type="text/javascript"></script>
    <script src="/Scripts/jquery/jquery.notice.js" type="text/javascript"></script>
    <script src="/Scripts/jquery/jquery.qtip.js" type="text/javascript"></script>
    <script src="/Scripts/jquery/jquery-ui-1.9.1.custom.js" type="text/javascript"></script> 
    <script src="/Scripts/jquery/jquery-timerpicker.js" type="text/javascript"></script>       
    <script src="/Scripts/jquery/jquery.form.json.js" type="text/javascript"></script>
    <script src="/Scripts/jquery/jquery-manager-error.js" type="text/javascript"></script>
    <script src="/Scripts/jquery/jquery.decimalMask.js" type="text/javascript"></script>
    <script src="/Scripts/grid.js" type="text/javascript"></script>
    <script src="/Scripts/json2.js" type="text/javascript"></script>
    <script src="/Scripts/menu.js" type="text/javascript"></script>
    <script src="/Scripts/commons.js" type="text/javascript"></script>
    <script src="/Scripts/jquery/jquery.maskedinput-1.2.2.js" type="text/javascript"></script>

    <script src="/Scripts/FileUpload/tmpl.min.js" type="text/javascript"></script>
    <script src="/Scripts/FileUpload/canvas-to-blob.min.js" type="text/javascript"></script>
    <script src="/Scripts/FileUpload/load-image.min.js" type="text/javascript"></script>
    <script src="/Scripts/FileUpload/jquery.iframe-transport.js" type="text/javascript"></script>
    <script src="/Scripts/FileUpload/jquery.fileupload.js" type="text/javascript"></script>
    <script src="/Scripts/FileUpload/jquery.fileupload-ip.js" type="text/javascript"></script>
    <script src="/Scripts/FileUpload/jquery.fileupload-ui.js" type="text/javascript" charset="ISO88591"></script>
    <script src="/Scripts/FileUpload/main.js" type="text/javascript"></script>
    <script src="/Scripts/FileUpload/locale.js" type="text/javascript"></script>

    <script src="js/accounting.min.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(document).ajaxStart(function () {
            $.blockUI({ overlayCSS: { opacity: .2 }, message: '<img src="/Content/images/main/loading.gif") />' });
        }).ajaxStop($.unblockUI);

    </script>

    <script type="text/javascript">

        var nId = "0";

        $(document).ready(function () {

            if (document.getElementById('txtPerfil').value == '-1') {
                document.getElementById('barraBotoes').style.display = 'none';
                document.getElementById('barraComentario').style.display = 'none';
                document.getElementById('barraJudicial').style.display = 'none';
            }

            rangeDatepickerBR('#DtEmissaoInicial', '#DtEmissaoFinal');

            $("#flex1").flexigrid({
                //                url: 'sinistro',
                //                method: 'GET',
                dataType: 'json',
                colModel: [
                        { display: 'ID', name: 'ID_SINISTRO', width: 41, sortable: true, align: 'left', process: abrirSinistro },
                        { display: 'Número do Sinistro', name: 'NR_SINISTRO', width: 100, sortable: true, align: 'left', process: abrirSinistro },
                        { display: 'Segurado', name: 'DS_CLIENTE', width: 250, sortable: true, align: 'left', process: abrirSinistro },
                        { display: 'Certificado', name: 'CD_CLIENTE_ETP', width: 80, sortable: true, align: 'left', process: abrirSinistro },
                        { display: 'Apolice', name: 'NR_APOLI_OFIC', width: 70, sortable: true, align: 'left', process: abrirSinistro },
                        { display: 'Estipulante', name: 'DS_ESTIPULANTE', width: 200, sortable: true, align: 'left', process: abrirSinistro },
                        { display: 'CPF', name: 'CPF', width: 90, sortable: true, align: 'left', process: abrirSinistro },
                        { display: 'Reserva', name: 'VR_RESERVA', width: 80, sortable: true, align: 'right', process: abrirSinistro },
                        { display: '', name: 'botao', width: 03, sortable: false, align: 'center', textButton: 'Abrir', ColumnButton: 'Abrir', FunctionButton: 'ExcluirApolice', Icon: 'ui-icon-gear', process: abrirSinistro }
                ],
                searchitems: [
                        { display: 'ID', name: 'ID_SINISTRO' },
                        { display: 'Número do Sinistro', name: 'NR_SINISTRO', isdefault: true },
                        { display: 'Nome do Segurado', name: 'DS_CLIENTE' }
                ],
                onError: function (jqXHR, textStatus, errorThrown) {
                    alert("flexigrid failed " + errorThrown + jqXHR + textStatus);
                },
                usepager: true,
                title: "",
                useRp: true,
                rp: 10,
                showTableToggleBtn: false,
                resizable: false,
                width: 1030,
                height: 331,
                singleSelect: true,
                cursorIcon: '1',
                newp: 1
            });

//            $('#flex1').dblclick(function (event) {
//                $('.trSelected', this).each(function () {
//                    var link = 'Sinistro.aspx?idSinistro='
//                    link = link + $('td[abbr="ID_SINISTRO"] >div', this).html();
//                    $(location).attr('href', link);
//                });
//            });

            
            $('#btnPesquisar').button({
                icons: {
                    primary: "ui-icon-search"
                },
                text: true
            })
            .click(function () {
//                Preenchergrid(1);
                Pesquisar();
            });

            $('#btnLimpar').button({
                icons: {
                    primary: "ui-icon-cancel"
                },
                text: true
            }).click(function () {
                ExcluirApolice();
            });

            $('#btnNovaApolice').button({
                icons: {
                    primary: "ui-icon-document"
                },
                text: true
            })
            .click(function () {
                window.location = 'aviso.aspx';
            });

            //Preenchergrid();

        });

        function abrirSinistro(celDiv, id) {
            if (celDiv.outerHTML.toLowerCase().indexOf('width: 41px') > 0) {
                nId = celDiv.innerHTML;
                 }
            celDiv.dataFld = nId;
            $(celDiv).dblclick(function () {
                var link = 'Sinistro.aspx?idSinistro='
                link = link + this.dataFld;
                $(location).attr('href', link);

            });
        }


        function ExcluirApolice() {
            window.location = 'Default.aspx';
        }

        function Pesquisar() {
            sinistrosGrid.style.display = 'block';
            $.ajax({
                type: "get",
                contentType: "application/json",
                url: "sinistro/" + document.getElementById('NrSinistro').value + "$" + document.getElementById('TxtSegurado').value + "$" + document.getElementById('NrSeguro').value + "$" + document.getElementById('NrApolice').value + "$" + document.getElementById('DtEmissaoInicial').value.replace(/\//g, '') + "$" + document.getElementById('DtEmissaoFinal').value.replace(/\//g, ''),
                data: "{}",
                dataType: 'json',
                success: function (result) {
                    //add data
                    $("#flex1").flexAddData(formatResults(result));

                }
            });
        }

        function formatResults(Sinistro) {
            var rows = Array();

            var str = "<div  style='text-align:right'>"; 

            for (i = 0; i < Sinistro.length; i++) {
                var item = Sinistro[i];
//                rows.push({ cell: [item.ID_SINISTRO, item.NR_SINISTRO, item.DS_CLIENTE, item.CD_CLIENTE_ETP, item.NR_APOLI_OFIC, item.DS_ESTIPULANTE, item.CPF, str.concat(accounting.formatMoney(item.VL_RESERVA, { symbol: "", precision: 2, decimal: ",", thousand: ".", format: { pos: "%s %v", neg: "%s (%v)", zero: "  --"} }), "</div>"), ''] });
                rows.push({ cell: [item.ID_SINISTRO, item.NR_SINISTRO, item.DS_CLIENTE, item.CD_CLIENTE_ETP, item.NR_APOLI_OFIC, item.DS_ESTIPULANTE, item.CPF, item.VL_RESERVA, ''] });
            }
            return { total: Sinistro.length, page: 1, rows: rows }
        }


        function showDetails(e) {
            e.preventDefault();

            alert(kendo.toString(ID_SINISTRO));

        }

        function DialogDownLoadDocumentos() {
            var id = $(this).attr('id').replace('btn_row', '');

        }
         
    </script>

</head>
<body>
    <div id="container">

    <form id="form1" runat="server">
       <asp:HiddenField runat="server" ID="txtPerfil" />
    </form>

<div id="container_menu">
    <div id="grupoMenu">
        <div id="menu" class="js-active">
            <ul class="menu" id="modulosMenu">
                <li><a href="#" class="parent"><span>Consultas</span></a><div><ul class="">
                    <li><a href="/reserva.aspx"><span>Evolução da Reserva</span></a></li>
                    <li><a href="/agenda.htm" target=_blank><span>Agenda</span></a></li>
                    </ul></div>
                </li>
                <li><a href="#" class="parent"><span>Serviços</span></a><div><ul class="">
                    <li><a href="http://1.0.0.113/Sinistros2/xml_contabil.aspx?dtIni=01012014&dtFim=01022014"><span>XML Contabil</span></a></li>
                    <li><a href="/gerarop.aspx"><span>Gerar Arquivo Pagnet</span></a></li>
                    <li><a href="/pagnet.aspx"><span>Download do Arquivo Pagnet</span></a></li>
                    <li><a href="/pagnetimp.aspx"><span>Processar Arquivo Retorno do Pagnet</span></a></li>
            </ul>
        </div>
        <div id="divSairSistema">
            <button type="button" id="btnSairSistema" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-primary" role="button" aria-disabled="false"><span class="ui-button-icon-primary ui-icon ui-icon-power"></span><span class="ui-button-text">Sair</span></button>
        </div>
    </div>
    <div class="clear"></div>
</div>
</div>

        <div id="container_body">


         <div id="title">
            <h3>
                
    Consultar Sinistros

            </h3>
         </div>

<div class="frame">
    <input type="hidden" id="CdStatus" />
    <h4>Pesquisa</h4>
    <form id="frmPesquisaEmissao" action="#" >

        <div class="cell"> 
            <label for="Apolice">Sinistro (N&#250;mero/ID)</label>           
            <input MaxLength="25" class="w150" id="NrSinistro" name="NrSinistro" onKeyPress="return NumberOnly(this, event)" type="text" value="" />
        </div>        

        <div class="cell"> 
            <label for="Apolice">Segurado (Nome/CPF)</label>           
            <input MaxLength="100" class="w300" id="TxtSegurado" name="TxtSegurado" type="text" value="" />
        </div>        

        <div class="cell"> 
            <label for="Apolice">Seguro (ID/Certificado)</label>           
            <input MaxLength="25" class="w150" id="NrSeguro" name="NrSeguro" onKeyPress="return NumberOnly(this, event)" type="text" value="" />
        </div>        

        <!--div class="cell"> 
            <label for="Sucursal">Sucursal</label>    
            <select class="w300 requerid" id="DdlSucursal" name="DdlSucursal"><option value="">Selecione</option>
<option value="1">1 - S&#227;o Paulo</option>
</select>
        </div>
        <div class="cell"> 
            <label for="Ramo">Ramo</label>    
            <select class="w300 requerid" id="DdlRamo" name="DdlRamo"><option value="">Selecione</option>
<option value="1">1 - Roubo</option>
</select>       
        </div>
        <div class="cell"> 
            <label for="ddlEstipulantes">Estipulante/Segurado</label>
            <select class="w350" id="DdlEstipulante" name="DdlEstipulante"><option value="">Selecione</option>
<option value="1297">.</option>
</select>
        </div-->

        <div class="clear"></div>
        <div class="cell"> 
            <label for="Apolice">N&#250;mero Ap&#243;lice</label>           
            <input MaxLength="25" class="w150" id="NrApolice" name="NrApolice" onKeyPress="return NumberOnly(this, event)" type="text" value="" />
        </div>        
        <div class="cell"> 
            <label for="DataInicial">Per&#237;odo do Aviso</label>           
            <input class="w75" id="DtEmissaoInicial" name="DtEmissaoInicial" type="text" value="" />  até <input class="w75" id="DtEmissaoFinal" name="DtEmissaoFinal" type="text" value="" />
        </div>
        <!--div class="cell"> 
            <label for="DataInicial">CPF/CNPJ</label> 
            <input class="w100" id="NrCpfCnpj" name="NrCpfCnpj" type="text" value="" />
        </div-->

        <div class="button-bar-inline-right">
            <button type="button" id="btnPesquisar">Pesquisar</button>
            <button type="button" id="btnNovaApolice">Novo Sinistro</button>
            <button type="button" id="btnLimpar">Limpar</button>
        </div>
        <div class="clear"></div>
    </form>
</div>


<div id="sinistrosGrid" class="frameResultado" runat="server" style="display: none"><table id="flex1"> </table>
</div>

        </div>

    </div>


</body>
</html>
