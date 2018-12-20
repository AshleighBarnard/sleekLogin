<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="gmap.aspx.vb" Inherits="findme2.gmap2" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" 

TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" runat="server">
  <title>MyTracking</title>
  <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
  <meta content="noindex,nofollow" name="robots">
  <!--META http-equiv="Pragma" content="no-cache">
<META http-equiv="Expires" content="Tue, 01 Jan 1980 12:12:02 GMT"-->
  <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=<% =gKey%>&libraries=drawing"></script>

  <script type="text/javascript" src="js/jquery-latest.min.js"></script>
  <script type="text/javascript" src="js/jquery.mousewheel-3.0.6.pack.js"></script>
  <script type="text/javascript" src="js/jquery.fancybox.js?v=2.1.5"></script>
  <link rel="stylesheet" href="js/jquery.fancybox.css?v=2.1.5" type="text/css" media="screen" />
  <script type="text/javascript" src="js/icon.js"></script>

  <script type="text/javascript" src="markerwithlabelflash.js"></script>
  <script src="js/controlpanel.js" type="text/javascript"></script>
  <style type="text/css">
    BODY {
      FONT-SIZE: 12px;
      FONT-FAMILY: arial;
      BACKGROUND-COLOR: #182c40
    }

    .heading {
      BORDER-RIGHT: black 1px solid;
      BORDER-TOP: black 1px solid;
      FONT-SIZE: 11px;
      BORDER-LEFT: black 1px solid;
      BORDER-BOTTOM: black 1px solid;

      BACKGROUND-COLOR: #90d7f5;
      bold: ;
      font-color: black
    }

    .headingText {
      FONT-SIZE: 11px;
      BACKGROUND-COLOR: #90d7f5;
      bold: ;
      font-color: black
    }

    A {
      COLOR: red
    }

    A:visited {
      COLOR: red
    }

    A:hover {
      COLOR: red
    }

    .caption {
      FONT-SIZE: 11px;
      TEXT-ALIGN: left;
      bold:
    }

    TABLE {
      FONT-SIZE: 10px;
      FONT-FAMILY: arial;
      BACKGROUND-COLOR: white;
      TEXT-ALIGN: center
    }

    .dataTableCellLeft {
      BORDER-RIGHT: black 0px solid;
      BORDER-TOP: black 0px solid;
      FONT-SIZE: 11px;
      BORDER-LEFT: black 1px solid;
      WIDTH: 50%;
      BORDER-BOTTOM:

        black 1px solid
    }

    .dataTableCellLeftNoBold {
      BORDER-RIGHT: black 0px solid;
      BORDER-TOP: black 0px solid;
      FONT-SIZE: 11px;
      BORDER-LEFT: black 1px solid;
      WIDTH: 50%;
      BORDER- BOTTOM: black 1px solid
    }

    .dataTableCellRight {
      BORDER-RIGHT: black 1px solid;
      BORDER-TOP: black 0px solid;
      FONT-SIZE: 11px;
      BORDER-LEFT: black 1px solid;
      BORDER-BOTTOM: black 1px solid;
      TEXT-ALIGN: center
    }

    .data {
      FONT-SIZE: 11px;
      TEXT-ALIGN: center
    }

    #hand_b {
      width: 31px;
      height: 31px;
      background-image: url(http://google.com/mapfiles/ms/t/Bsu.png);
    }

    #hand_b.selected {
      background-image: url(http://google.com/mapfiles/ms/t/Bsd.png);
    }

    #shape_b {
      width: 31px;
      height: 31px;
      background-image: url(http://google.com/mapfiles/ms/t/Bpu.png);
    }

    #shape_b.selected {
      background-image: url(http://google.com/mapfiles/ms/t/Bpd.png);
    }

    .Yellow {
      color: black;
      background-color: yellow;
      font-family: "Lucida Grande", "Arial", sans-serif;
      font-size: 10px;
      font-weight: bold;
      text-align: center;
      border: 2px solid black;
      padding-left: 2px;
      padding-right: 2px;
      white-space: nowrap;
    }

    .LightBlue {
      color: black;
      background-color: LightBlue;
      font-family: "Lucida Grande", "Arial", sans-serif;
      font-size: 10px;
      font-weight: bold;
      text-align: center;
      border: 2px solid black;
      padding-left: 2px;
      padding-right: 2px;
      white-space: nowrap;
    }

    .Red {
      color: black;
      background-color: red;
      font-family: "Lucida Grande", "Arial", sans-serif;
      font-size: 10px;
      font-weight: bold;
      text-align: center;
      border: 2px solid black;
      padding-left: 2px;
      padding-right: 2px;
      white-space: nowrap;
    }

    .GreenYellow {
      color: black;
      background-color: GreenYellow;
      font-family: "Lucida Grande", "Arial", sans-serif;
      font-size: 10px;
      font-weight: bold;
      text-align: center;
      border: 2px solid black;
      padding-left: 2px;
      padding-right: 2px;
      white-space: nowrap;
    }

    .Orange {
      color: black;
      background-color: orange;
      font-family: "Lucida Grande", "Arial", sans-serif;
      font-size: 10px;
      font-weight: bold;
      text-align: center;
      border: 2px solid black;
      padding-left: 2px;
      padding-right: 2px;
      white-space: nowrap;
    }

    .legend {
      position: absolute;
      z-index: 999;
      float: right;
      text-decoration: none;
      bottom: 0px;
      left: 0px;
      font-size: 14px;
      letter-spacing: -1px;
      font-family:

        verdana, helvetica, arial, sans-serif;
      color: #fff;
      padding: 10px 10px 10px 10px;
      font-weight: 500;
      background: #000000;
      background-repeat: no-repeat;
      border: 0px solid #444444;
      -moz-border-radius-topleft: 20px;
      -webkit-border-top-left-radius: 20px;
      -moz-border-radius-bottomleft: 20px;
      -webkit-border-bottom-left-radius:

        20px;
      -moz-border-radius-bottomright: 0px;
      -webkit-border-bottom-right-radius: 0px;
      filter: alpha(opacity=85);
      opacity: .85;
      display: block;
      min-width: 10px;
      text- align: left;
    }

    .tabcontenton,
    .tabcontentoff {
      padding: 5px;
      FONT-SIZE: 15px;
      text-align: left;
    }

    .tabcontentoff {
      display: none;
    }

    .tabcontentwrapper {
      position: relative;
    }
  </style>
  <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
  <script src="js/jquery.tabSlideOut.v1.3.js"></script>
  <script>
    $(function () {
      $('.disp1').tabSlideOut({
        tabLocation: 'right',                               //side of screen where tab lives, top, right, bottom, or left
        speed: 333,                                        //speed of animation
        action: 'click',                                   //options: 'click' or 'hover', action to trigger animation
        topPos: '75px',                                   //position from the top
        onLoadSlideOut: true,
        fixedPosition: false                               //options: true makes it stick(fixed position) on scroll
      });
    });

    $(function () {
      $('.slide-out-div1').tabSlideOut({
        tabHandle: '.handle1',                              //class of the element that will be your tab
        pathToTabImage: 'images/btnCal.png',          //path to the image for the tab (optionaly can be set using css)
        imageHeight: '167px',                               //height of tab image
        imageWidth: '45px',                             //width of tab image   
        tabLocation: 'right',                               //side of screen where tab lives, top, right, bottom, or left
        speed: 555,                                        //speed of animation
        action: 'click',                                   //options: 'click' or 'hover', action to trigger animation
        topPos: '277px',                                //position from the top            
        fixedPosition: false                               //options: true makes it stick(fixed position) on scroll
      });
    });

    $(function GeoFenceSlideOut() {
      if ((document.getElementById('<%= Button2.ClientID %>').value.toLowerCase().indexOf('set') < 0)) {
        $('.slide-out-div2').tabSlideOut({
          tabHandle: '.handle2',                              //class of the element that will be your tab
          pathToTabImage: 'images/btnGeo.png',          //path to the image for the tab (optionaly can be set using css)
          imageHeight: '157px',                               //height of tab image
          imageWidth: '45px',                             //width of tab image    
          tabLocation: 'right',                               //side of screen where tab lives, top, right, bottom, or left
          speed: 555,                                        //speed of animation
          action: 'click',                                   //options: 'click' or 'hover', action to trigger animation
          topPos: '432px',                                   //position from the top
          fixedPosition: false                               //options: true makes it stick(fixed position) on scroll
        }); //,function() { };
      }
    });

    $(function () {
      if ((document.getElementById('<%= Button2.ClientID %>').value.toLowerCase().indexOf('set') >= 0)) {
        $('.slide-out-div2').tabSlideOut({
          tabHandle: '.handle2',                              //class of the element that will be your tab
          pathToTabImage: 'images/btnGeo.png',          //path to the image for the tab (optionaly can be set using css)
          imageHeight: '157px',                               //height of tab image
          imageWidth: '45px',                             //width of tab image    
          tabLocation: 'right',                               //side of screen where tab lives, top, right, bottom, or left
          speed: 555,                                        //speed of animation
          action: 'click',                                   //options: 'click' or 'hover', action to trigger animation
          topPos: '432px',                                   //position from the top
          fixedPosition: false,                               //options: true makes it stick(fixed position) on scroll
          onLoadSlideOut: true
        }); //,function() { };
      }
    });

    $(function () {
      $('.slide-out-div3').tabSlideOut({
        tabHandle: '.handle3',                              //class of the element that will be your tab
        pathToTabImage: 'images/btnRep.png',          //path to the image for the tab (optionaly can be set using css)
        imageHeight: '165px',                               //height of tab image
        imageWidth: '45px',                             //width of tab image   
        tabLocation: 'right',                               //side of screen where tab lives, top, right, bottom, or left
        speed: 555,                                        //speed of animation
        action: 'click',                                   //options: 'click' or 'hover', action to trigger animation
        topPos: '587px',                                   //position from the top
        fixedPosition: false                               //options: true makes it stick(fixed position) on scroll
      });
    });

    $(function () {
      $('.slide-out-div4').tabSlideOut({
        tabHandle: '.handle4',                              //class of the element that will be your tab
        pathToTabImage: 'images/btnser.png',          //path to the image for the tab (optionaly can be set using css)
        imageHeight: '167px',                               //height of tab image
        imageWidth: '45px',                             //width of tab image   
        tabLocation: 'right',                               //side of screen where tab lives, top, right, bottom, or left
        speed: 555,                                        //speed of animation
        action: 'click',                                   //options: 'click' or 'hover', action to trigger animation
        topPos: '742px',                                   //position from the top
        fixedPosition: false                               //options: true makes it stick(fixed position) on scroll
      });
    });
  </script>
</HEAD>

<body bgcolor="black">
  <center>
    <form id="Form1" style="PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px"
      method="post" runat="server">
      <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
      <TABLE id="Table5" style="BORDER-RIGHT: #8cd4fd 4px groove; BORDER-TOP: #8cd4fd 4px groove; BORDER-LEFT: #8cd4fd 4px groove; BORDER-BOTTOM: #8cd4fd 4px 

groove"
        borderColor="#000000" cellSpacing="0" cellPadding="0" rules="none" bgColor="white" border="1" frame="border">
        <tr style="height:76px; width:100%" id="headertr">
          <td align="left" valign="top" class="style8">
            <table style="width:100%;background-image: url('images/Banner_repeat.png'); background-repeat:repeat; height: 76px;"
              id="tbl1" cellpadding="0" cellspacing="0">
              <tr style="height:76px;">
                <td style="width:100%; background-image: url('images/TrackingPortal.png'); background-repeat: no-repeat; height: 76px;">&nbsp;
                </td>
                <td align="right" style="height:76px;background-image:url('images/Banner_repeat.png'); background-repeat: repeat;width:100px">
                </td>
                <td align="right" style="height:76px;background-image:url('images/Banner_repeat.png'); background-repeat: repeat;width:300px">
                  <table id="tbl2" style="height:76px; width:100%;background:transparent">
                    <tr id="imagetd">
                      <td align="left" style="width:170px">
                        <table id="tbl3" cellpadding="0" cellspacing="0" width="170px" style="border-width:0;background-color:Transparent">
                          <tr>
                            <td valign="top">
                              <asp:label id="Label12" runat="server" BackColor="transparent" CssClass="transparency">FOUND
                                USER: </asp:label>
                            </td>
                            <td valign="top">
                              <asp:label id="Label1" runat="server" CssClass="transparency" BackColor="transparent">User
                                ID Label</asp:label>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="2" style="height:1px"></td>
                          </tr>
                          <tr>
                            <td valign="top">
                              <asp:label id="Label9" runat="server" BackColor="transparent" CssClass="transparency">LAST
                                REPORT:</asp:label>
                            </td>
                            <td valign="top" style="width:75px">
                              <asp:label id="Label2" runat="server" CssClass="transparency" Width="75px">Last Rpt</asp:label>
                            </td>
                          </tr>

                          <tr>
                            <td colspan="2" align="left" style="display:none">
                              <asp:label id="Label8" style="FONT-SIZE: 11px" runat="server" BackColor="Transparent"
                                ForeColor="White">Label8</asp:label>
                            </td>
                          </tr>
                        </table>
                      </td>
                      <td align="right">
                        <div style="margin-top:10px;width:30px;margin-right:30px;color:White"></div>
                        <asp:Panel ID="Panel1" runat="server" Width="150" Height="29">

                          <div>
                            <asp:Label ID="lblBatteryLevel" runat="server" CssClass="transparency" Width="75px">Battery

                              Level:</asp:Label>
                            <asp:Image ID="BatteryImage" runat="server" />
                          </div>
                          <div id="sTXT" style="margin-top:-20px;width:30px;margin-right:10px;">
                            <asp:Label ID="lblBatteryCharge" runat="server" Visible="true" ForeColor="Black"></asp:Label>
                          </div>
                        </asp:Panel>

                        <div id="flashdiv" style="width:58px;">
                          <object classid="clsid:D27CDB6E-AE6D-11CF-96B8-444553540000" id="obj1" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,40,0"
                            border="0" width="58" height="29">
                            <param name="movie" value="/Flash/b1.swf" />
                            <param name="quality" value="High" />
                            <embed src="/Flash/b1.swf" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash"
                              name="obj1" width="50" height="29"></embed>
                          </object>
                        </div>

                      </td>
                    </tr>
                    <tr>
                      <td align="left" colspan="2" id="tdUserDropDown">
                        <table cellpadding="0" cellspacing="0" style="border-width:0;background-color:Transparent;width:100%; height: 26px;">
                          <tr>
                            <td align="left">
                              <asp:label id="Label13" runat="server" Visible="False" BackColor="transparent" CssClass="transparency">SELECT

                                USER:</asp:label>
                            </td>
                            <td align="left" style="width:140px">
                              <asp:DropDownList ID="DropDownList2" runat="server" Visible="False" Width="140px"></asp:DropDownList>


                            </td>
                            <td align="left" style="width:30px">
                              <asp:Label ID="Label0" runat="server" Width="30px" Visible="False" BackColor="Transparent"
                                ForeColor="White">Password:</asp:Label>
                            </td>
                            <td align="left" style="width:60px;">
                              <asp:TextBox ID="TextBoxGpw" runat="server" Visible="False" TextMode="Password" Text="*****"
                                Width="60px" CausesValidation="True" ToolTip='If needed, enter 

the group password here, then click the "GET" button to the left.'></asp:TextBox>
                            </td>
                            <td align="left" style="width:40px; padding-left:1px">
                              <asp:button id="ButtonGrpPw" runat="server" Visible="False" Width="40px" Text="Get"
                                ToolTip="Select another user 

or group, enter a password if needed, then click this button."></asp:button>
                            </td>
                          </tr>
                        </table>
                      </td>

                    </tr>

                  </table>
                </td>
              </tr>
            </table>
          </td>
          <%--<td width="0%" style="display:none" class="style9"></td>
                        <td width="0%" style="display:none" class="style9"></td>--%>
        </tr>
        <TR>
          <TD vAlign="middle" align="center">
            <table cellSpacing="5" cellPadding="0" border="0">
              <tr>
                <td vAlign="top" align="center" style="height: 580px">
                  <DIV id="map" style="BORDER-RIGHT: black 1px solid; BORDER-TOP: black 1px solid; BORDER-LEFT: black 1px solid; BORDER-BOTTOM: black 1px solid; "></DIV>
                  <%--asp:label id="Label8" style="FONT-SIZE: 12px;" runat="server" ></asp:label--%><br />
                  <INPUT id="myZoom" style="FONT-SIZE: xx-small; VISIBILITY: hidden; WIDTH: 16px; HEIGHT: 16px"
                    readOnly type="text" maxLength="12" size="1" value="7" runat="server">
                  <asp:label id="Label15" runat="server" Visible="False">x</asp:label>
                  <INPUT id="mStyle" style="FONT-SIZE: xx-small; VISIBILITY: hidden; WIDTH: 16px; HEIGHT: 16px"
                    readOnly type="text" maxLength="66" size="5" runat="server"><INPUT id="bounds" style="FONT-SIZE: xx-small; VISIBILITY: hidden; WIDTH: 15px; HEIGHT: 16px"
                    readOnly type="text" maxLength="200" size="16" runat="server"><INPUT id="dxMode" style="VISIBILITY: hidden; WIDTH: 16px; HEIGHT: 16px"
                    type="text" runat="server">
                  <input id="gPwd" runat="server" style="visibility: hidden; width: 16px; height: 16px" type="text" />
                  <input id="lastBattVal" runat="server" style="visibility: hidden; width: 16px; height: 16px;" type="text" />


                  <input id="deletedFences" runat="server" style="visibility: hidden; width: 16px; height: 16px;" type="text" />
                  <%--

</td>
<TD id="logoImg" vAlign="top" align="center" style="visibility: hidden;width: 200px;">--%>
                  <div style="display:none">
                    <TABLE cellSpacing="0" cellPadding="3" border="0" style="color:white;width: 100%;">
                      <tr>
                        <td class="heading" colSpan="2">
                          <nobr>FOUND USER:
                            <%--asp:label class="headingtext" id="Label1" runat="server">Name</asp:label--%>
                          </nobr>
                        </td>
                      </tr>
                      <TR>
                        <TD class="dataTableCellLeft">Last Report:&nbsp;</TD>
                        <td class="dataTableCellRight">
                          <%--asp:label class="data" id="Label2" runat="server" Width="103px">Last Rpt</asp:label--%>
                        </td>
                      </TR>
                      <TR>
                        <TD class="dataTableCellLeft">
                          <asp:label id="LabelAlt" runat="server">Altitude:</asp:label>
                        </TD>
                        <TD class="dataTableCellRight">
                          <%--<asp:label class="data" id="Label3" runat="server" Width="48px">Label</asp:label>--%>
                        </TD>
                      </TR>
                      <TR>
                        <TD class="dataTableCellLeft">Speed:</TD>
                        <TD class="dataTableCellRight">
                          <asp:label class="data" id="Label4" runat="server">Label</asp:label>
                        </TD>
                      </TR>
                      <TR>
                        <TD class="dataTableCellLeft">Course:</TD>
                        <TD class="dataTableCellRight">
                          <asp:label class="data" id="Label5" runat="server">Label</asp:label>
                        </TD>
                      </TR>
                      <TR>
                        <TD class="dataTableCellLeft"><INPUT id="reFresh" type="checkbox" CHECKED runat="server">
                          Refresh:</TD>
                        <TD class="dataTableCellRight">
                          <asp:textbox id="TextBox1" style="TEXT-ALIGN: center; font-size: xx-small;  height: 18px; WIDTH: 50px;"
                            runat="server" Enabled="False" border="0" ReadOnly="True">255</asp:textbox>
                        </TD>
                      </TR>
                      <TR>
                        <TD class="dataTableCellLeft">Latitude:<BR>
                          Longitude:</TD>
                        <TD class="dataTableCellRight">
                          <asp:label id="Label6" runat="server" Width="76px">-39.545633</asp:label><br>
                          <asp:label id="Label7" runat="server" Width="88px">-106.095222</asp:label>
                        </TD>
                      </TR>
                    </TABLE>
                    <table style="color:white;border-collapse:collapse; table-layout: fixed;">
                      <tr>
                        <td>
                          <%--<asp:checkbox id="CheckBox1" runat="server" Text="BreadCrumbs" ToolTip="View all position reports." AutoPostBack="True" style="font-weight: 

bold; font-size: 14px; color: blue"></asp:checkbox>--%>
                        </td>
                      </tr>
                      <tr>
                        <td style="padding-bottom: 5px; padding-top: 5px; ">
                          <div id="battGrn" title="Battery level" style="font-size:5px; width:0; background-color:green; float:left; ">&nbsp;</div>
                          <div id="battRed" title="Battery level" style="font-size:5px; width: 100%; background-color: white; float:right; ">&nbsp;</div>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <%--<asp:calendar id="Calendar1" runat="server" Width="200px" ForeColor="Black"
SelectionMode="None" ShowGridLines="True">
<DayStyle BackColor="White"></DayStyle>
<DayHeaderStyle BackColor="#F0EC70"></DayHeaderStyle>
<TitleStyle ForeColor="Black" BackColor="#90D7F5"></TitleStyle>
                                                        <TodayDayStyle BorderColor="Magenta" BorderStyle="Solid" BorderWidth="3px" /></asp:calendar>--%>
                          <div style="text-align:left;">
                            <%--<asp:Button ID="ButtonGrpPw" runat="server" Text="Group Password" Visible="False"/>&nbsp;--%>
                            <%--<asp:TextBox ID="TextBoxGpw" runat="server" MaxLength="12" Visible="False" style="width: 

40px;">0000</asp:TextBox>--%><br />
                            <%--<asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" Font-Names="Courier New"
                                                        Visible="False"></asp:DropDownList>--%>
                          </div>

                          <div id="myHRdiv" runat="server" style="visibility:hidden;">
                            <hr size="5" color="maroon" />
                          </div>
                          <div style="text-align:left;">
                            <%--<asp:textbox id="fenceBox" style="TEXT-ALIGN: center; WIDTH: 173px;" runat="server" Visible="False"	

ToolTip='Enter an email address or a cellphone number with a "+" prefix.' MaxLength="66">myemail@address.com</asp:textbox><br />
                       <asp:TextBox ID="fencePWbox" runat="server" style="TEXT-ALIGN: center; width: 66px;" Visible="False" ToolTip="You will need the 

account's password to create fences.">password</asp:TextBox>&nbsp;
                       <asp:DropDownList ID="fenceTypeList" runat="server" Visible="False">
                                            <asp:ListItem>Enter</asp:ListItem>
                                            <asp:ListItem>Exit</asp:ListItem>
                                            <asp:ListItem>Both</asp:ListItem>
                                            <asp:ListItem Selected="True">1Shot</asp:ListItem>
                                           </asp:DropDownList>
                       <asp:button id="Button2" runat="server" Text="geoFence" ToolTip="An alert will be sent if target enters (or leaves) this area. To 

cancel, click today's date on the calendar."></asp:button>
                       <INPUT id="Button5" style="VISIBILITY: hidden" type="button" value="Poll" runat="server">--%>
                          </div>
                          <hr size="5" color="maroon" />

                          <!--A href="veMap.aspx?name=<% =localName %>&gpasswd=<% =grpPassword %>" ><IMG id="Img2" height="30" alt="" src="veLogo.gif" runat="server"></A-->

                          &nbsp;&nbsp;
                          <A href="mQuest.aspx?name=<% =localName %>&gpasswd=<% =grpPassword %>"><IMG id="Img4" height="30"
                              src="MQlogo.gif" runat="server"></A>
                          <hr size="5" color="maroon" />

                          <div style="text-align:left">
                            <img src="download.gif">
                            <%--<span style="vertical-align:top"><asp:hyperlink id="HyperLink2" runat="server" Enabled="False" style = "font-size: 15px; color: black;"> 

Download</asp:hyperlink></span>--%><br>
                            <img src="dReport.gif">
                            <%--<span style="vertical-align:top"><asp:hyperlink id="HyperLink1" runat="server" Target="_blank" style = "font-size: 15px; color: black;">Drive 

Report</asp:hyperlink></span>--%><br>
                            <img src="alerts.gif">
                            <%--<span style="vertical-align:top"><asp:HyperLink ID="HyperLink4" runat="server" Target="_blank" style = "font-size: 15px; color: 

black;">Events</asp:HyperLink></span>--%><br>
                            <img src="statsReport.gif">
                            <%--<span style="vertical-align:top"><asp:HyperLink ID="HyperLinkStats" runat="server" Target="_blank" style = "font-size: 15px; color: 

black;">Stats</asp:HyperLink></span>--%><br>
                            <img src="GEicon.gif">
                            <%--<span style="vertical-align:top"><asp:hyperlink id="HyperLink3" runat="server" Target="_blank" style = "font-size: 15px; color: black;">View with 

Google Earth</asp:hyperlink></span>--%><br>
                            <img id="geIcon" src="GEicon.gif">
                            <span style="vertical-align:top">
                              <asp:HyperLink ID="HyperLinkGErt" runat="server" Target="_blank" style="font-size: 15px; color: black;">GE

                                RealTime</asp:HyperLink>
                            </span>
                          </div>

                        </td>
                      </tr>
                    </table>
                  </div>
                </TD>
              </tr>
            </table>
          </TD>
        </TR>
      </TABLE>
      <div class="disp1">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" style="background-color:Transparent; height: 181px;">
          <tr>
            <td width="42%" style="height:100px">
              <div id="compass" class="compass" style="background:transparent url(images/compass/e.png) no-repeat"></div>
            </td>

            <td width="58%" valign="top">
              <table width="100%" border="0" cellspacing="0" cellpadding="0" style="color:white;background:transparent; padding-top:10px; height: 88px;">
                <tr>
                  <td valign="top" style="height:45px" align="center">
                    <div class="att" style=" margin: 15px 0 0 0">
                      Altitude : <asp:label class="data" id="Label3" runat="server" Width="48px">Label</asp:label>
                    </div>
                  </td>
                </tr>
                <tr>
                  <td width="10%" align="center" style="padding:0 1px 0 0;">
                    <asp:checkbox id="CheckBox1" runat="server" ToolTip="View all position 

reports." Text="BreadCrumbs"
                      AutoPostBack="True"></asp:checkbox>
                  </td>
                </tr>
                <tr>
                  <td width="10%" align="center" style="padding:0 29px 0 0;">
                    <%--<input id="reFresh" type="checkbox" CHECKED runat="server"/>Refresh--

%>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td colspan="2" style="width:110px">
              <div id="speedo" class="speedo"></div>
            </td>
          </tr>
          <tr>
            <td style="width:110px;padding-top:3px;padding-left:33px" align="left">
              <div>
                <%-- <asp:ImageButton ID="imgbuttonHelp" runat="server" ImageUrl="images/helpicon.gif"/>        --%>
                <asp:Panel runat="server" ID="outerpopuppanel" Height="120px" Width="320px" CssClass="modalPopupouter"
                  style="display:none;">
                  <asp:Panel runat="server" ID="innerpopuppanel" Height="140px" CssClass="modalPopupinner">
                    <table width="320px" style="color:white;background-color: #1A3961; height: 90px;">
                      <tr style="width:300px">
                        <td style="height:5px;width:300px">
                        </td>
                      </tr>
                      <tr>
                        <td align="center" style="height:25px">
                        </td>
                      </tr>
                      <tr>
                        <td align="center" style="height:25px">
                          <asp:Label ID="lblphone" runat="server" Text=" Phone Support : 732-375-9200" CssClass="helplabelcss"></asp:Label>
                        </td>
                      </tr>
                      <tr>
                        <td align="center" style="height:25px;">
                          <asp:Label ID="lblsupport" runat="server" Text="Email Support : support@rt1gps.com" Font-Bold="true"
                            CssClass="helplabelcss"></asp:Label>
                        </td>
                      </tr>
                      <tr>
                        <td align="center" style="height:38px;vertical-align:middle">
                          <asp:Button ID="btnOk" runat="server" Text="Ok" Width="55px" Font-Bold="true" ForeColor="MidnightBlue"
                            BackColor="Gainsboro" />
                        </td>
                      </tr>
                    </table>
                  </asp:Panel>
                </asp:Panel>
              </div>
              <cc1:ModalPopupExtender ID="mpoupextender" runat="server" TargetControlID="imgbuttonHelp" PopupControlID="outerpopuppanel"
                DropShadow="false" BackgroundCssClass="GrayedOut" OkControlID="btnOk"></cc1:ModalPopupExtender>
              <cc1:RoundedCornersExtender ID="RoundedCornersExtender1" runat="server" TargetControlID="innerpopuppanel"
                Radius="20">
              </cc1:RoundedCornersExtender>
            </td>
            <td>&nbsp;</td>
          </tr>
        </table>
        <div id="helpdiv" style="margin-top:-195px;width:30px;margin-left:10px;">
          <asp:ImageButton ID="imgbuttonHelp" runat="server" ImageUrl="images/helpicon.gif" />
        </div>
      </div>

      <div class="slide-out-div1"><a href="#" class="handle1" style="font-size:small; font-weight:bolder; font-family:Verdana; color: #ADD8E6; text-

decoration:none;"
          title="Click to view Tracking history"><br /><br /><br /><br /><br /><br />
          <</a> <div class="calendar">
            <table id="tblCalendar" width="130px" cellspacing="0" cellpadding="0" border="1" rules="all" style="color:white;height:50px;">
              <tr style="width:100%">
                <td align="justify">
                  <asp:calendar id="Calendar1" runat="server" CellPadding="0" Height="50px" ToolTip="View tracks from previous days here."
                    SelectionMode="None" ShowGridLines="True" BorderColor="Black" TitleFormat="MonthYear">
                    <NextPrevStyle BackColor="white" BorderColor="Black" ForeColor="Black" CssClass="monthstyle" />
                    <DayStyle BackColor="White"></DayStyle>
                    <DayHeaderStyle BackColor="#F0EC70"></DayHeaderStyle>
                    <TitleStyle ForeColor="Black" BackColor="#90D7F5"></TitleStyle>
                    <TodayDayStyle BorderColor="Magenta" BorderStyle="Solid" BorderWidth="3px" />
                  </asp:calendar>
                </td>
              </tr>
            </table>

      </div>


      </div>

      <div class="slide-out-div2" runat="server"> <a href="#" class="handle2" style="font-size:small; font-weight:bolder; font-family:Verdana; color: #ADD8E6; 

text-decoration:none;"
          title="Click to Enable Geo-Fence"><br /><br /><br /><br /><br /><br />
          <</a> <table id="geoFence" cellspacing="0" cellpadding="0" width="90%" style="color:white;background-color:Transparent; border-style:none; height: 123px;">
            <tr>
              <td colspan="2" style="height:3px"></td>
            </tr>
            <tr>
              <td align="right" style="padding-top:10px">
                <asp:LinkButton ID="lnkHelp" runat="server" ForeColor="Red" OnClientClick="javascript:DisplayInstruction();return false;">[Help]</asp:LinkButton>
              </td>
            </tr>
            <tr>

              <td align="left" style="padding-left:47px;" class="style5">
                &nbsp;<asp:button id="Button2" runat="server" Width="110px" Height="26px" Text="GeoFence"></asp:button><br />
              </td>

            </tr>
            <tr>
              <td style="height:21px;padding-left:47px" align="left">
                <asp:DropDownList id="fenceTypeList" runat="server" Width="110px" Height="22px" Visible="false">
                  <asp:ListItem Value="Enter">Enter</asp:ListItem>
                  <asp:ListItem Value="Exit">Exit</asp:ListItem>
                  <asp:ListItem Value="Both" Selected="True">Both</asp:ListItem>
                  <asp:ListItem Value="1Shot">1Shot</asp:ListItem>
                </asp:DropDownList>
                <asp:Label ID="lblfenceTypeList" runat="server" Text="Type" Visible="false"></asp:Label>
              </td>
              <td class="style4" align="left" style="height:21px;padding-bottom:2px;padding-left:47px">
                &nbsp;</td>
            </tr>
            <tr>

              <td align="left" style="height:19px;padding-left:47px">
                <asp:textbox id="fenceBox" Visible="false" style="TEXT-ALIGN: left; width: 110px;" runat="server"
                  ToolTip="For SMS, use + prefix" MaxLength="150" CssClass="geo-fence-email">myemail@mail.com</asp:textbox>
              </td>
            </tr>
            <tr>
              <td align="left" style="height:19px;padding-left:47px">
                <asp:TextBox id="fencePWbox" runat="server" style="TEXT-ALIGN: left; width: 110px;" CssClass="geo-fence-email"
                  Visible="false">Password</asp:TextBox>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" class="style7">
                <asp:textbox id="TextBox2" runat="server" CssClass="addressTextbox" ToolTip='Enter address as street,city,state. Or just enter a "place" name like  

"lake geneva".'
                  MaxLength="160" Width="110px" Height="17px" Text="Find Address" onfocus="this.value =' '; " onblur="if(this.value == ' ') this.value='Find 

Address';"></asp:textbox>
                &nbsp;
              </td>
              <td align="left" valign="top">
                <input id="GeoButton" type="button" Width="45px" CssClass="btnGo" BorderStyle="None" BackColor="Transparent"
                  value="Find" ToolTip="Enter address, place, or 

coords (lat,lon)." Height="22px" onclick="javascript:codeAddress();" />
              </td>
            </tr>
            </table>
      </div>
      <div class="slide-out-div3"> <a href="#" class="handle3" style="font-size:small; font-weight:bolder; font-family:Verdana; color: #ADD8E6; text-

decoration:none;"
          title="Click to View Reports"><br /><br /><br /><br /><br /><br />
          <</a> <table id="Reports" title="Reports" cellspacing="0" width="80%" style="color:white;background-color:Transparent; border-style:none; margin-left: 15px; 

margin-top:20px">
            <tr>
              <td align="left" colspan="2">
                <asp:hyperlink id="HyperLink2" runat="server" Width="143px" ToolTip="Retrieve the data in .csv format."
                  Enabled="False" ImageUrl="images/btnDwn.png"> Download Data</asp:hyperlink>
              </td>
            </tr>
            <tr>
              <td align="left" colspan="2">
                <asp:hyperlink id="HyperLink3" runat="server" Width="143px" ImageUrl="images/btnGoogle.png" Target="_blank">View
                  with

                  Google Earth</asp:hyperlink>
              </td>
            </tr>
            <tr>
              <td align="left" class="style7">
                <asp:hyperlink id="HyperLink1" runat="server" Width="85px" ToolTip="Starts and stops for the day."
                  Target="_blank" ImageUrl="images/btnDr.png">Drive Report</asp:hyperlink>
              </td>
              <td align="left">
                <asp:hyperlink id="HyperLinkStats" runat="server" Width="55px" ToolTip="Mileage info for the year."
                  Target="_blank" ImageUrl="images/btn_stats.png">Stats</asp:hyperlink>
              </td>
            </tr>

            <tr>
              <td align="left" class="style2">
                <asp:HyperLink ID="HyperLink4" runat="server" Target="_blank" Width="90px" ToolTip="Event Reports"
                  ImageUrl="~/images/btnevents.png">Events</asp:HyperLink>
              </td>
              <td id="tdbtnpolls" align="left" style="height:22px;" runat="server">
                <%--<asp:button id="Button3" runat="server" Width="64px" Text="Send Msg" ToolTip="Send a text message. For PDA/smartPhones only. "></asp:button>--%>
                <INPUT id="Button5" style="VISIBILITY: hidden; WIDTH: 2px; HEIGHT: 24px" type="button" value="Poll"
                  name="Button5" runat="server" src="/images/btn_polls.png">
                <%--<input name="Button5" type="button"  id="Button5" runat="server" class="btnpolls"  
        onclick="popUpWindow(&quot;sendSMS.aspx?

name=0377994&quot;,&quot;XX&quot;,&quot;240&quot;,&quot;240&quot;,&quot;100&quot;,&quot;100&quot;,&quot;YY&quot;,&quot;no&quot;)" />--%>
              </td>
            </tr>
            </table>
      </div>
      <div class="slide-out-div4"> <a href="#" class="handle4" style="font-size:small; font-weight:bolder; font-family:Verdana; color: #ADD8E6; text-

decoration:none;"
          title="Click to View Services"><br /><br /><br /><br /><br /><br />
          <</a> <table id="Services" title="Services" cellspacing="0" width="115px" style="color:white;background-color:Transparent; border-style:none; margin-left: 15px; 

margin-top:15px">
            <tr>
              <td align="left" valign="top" colspan=2>
                <input id="CallButton1" type="image" height="73%" CssClass="btnGo" BorderStyle="None" BackColor="Transparent"
                  src="images/1800x95.png" ToolTip="Click to 

Call +1-800-810-GUARD" onclick='window.open("tel:+1-800-810-GUARD");return(false);' />
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle" colspan=2>
                <input id="CallButton2" type="image" height="73%" CssClass="btnGo" BorderStyle="None" BackColor="Transparent"
                  src="images/carguardx85.png" value="Private 

Investigator" ToolTip="Click to Call +1-800-98-DETECTIVE"
                  onclick='window.open("tel:+1-800-98-DETECTIVE");return(false);' />
              </td>
            </tr>
            <tr>
              <td align="left" valign="bottom" colspan=2>
                <input id="CallButton3" type="image" height="73%" CssClass="btnGo" BorderStyle="None" BackColor="Transparent"
                  src="images/carguardx85911.png" value="Car 

Guard" ToolTip="Click to Call +1-732-375-9200" onclick='window.open("tel:+1-732-375-9200");return(false);' />
              </td>
            </tr>
            </table>
      </div>
      </div>

      <div id="legendId" class="legend">
        <div id="cnTabContentContainer" class="tabcontentwrapper">
          <div class="tabcontenton">
            <b>
              <a class="fancybox" href="#inline1" title="Click to change icon"><img src="css/automobile.png" alt="automobile"
                  height="42" width="42"></a>
            </b>
            <br>
          </div>
          <div id="inline1" style="width: 375px; height:auto; display: none;">
            <form method="POST" action="">
              <input type="hidden" name="editCnID" value="cnTabContentContainer">

              <style type="text/css">
                .tg {
                  border-collapse: collapse;
                  border-spacing: 0;
                }

                .tg td {
                  font-family: Arial, sans-serif;
                  font-size: 14px;
                  padding: 10px 5px;
                  border-style: solid;
                  border-width: 1px;
                  overflow: hidden;
                  word-break: normal;
                  border- color: black;
                }

                .tg th {
                  font-family: Arial, sans-serif;
                  font-size: 14px;
                  font-weight: normal;
                  padding: 10px 5px;
                  border-style: solid;
                  border-width: 1px;
                  overflow: hidden;
                  word- break: normal;
                  border-color: black;
                }

                .tg .tg-0pky {
                  border-color: inherit;
                  text-align: left;
                  vertical-align: top
                }

                .tg .tg-0lax {
                  text-align: left;
                  vertical-align: top
                }
              </style>
              <table class="tg">
                <tr>
                  <th class="tg-0pky" onclick="togCell('red', 'atm')"><img src="css/atm.png" alt="automobile" height="42"
                      width="42"></th>
                  <th class="tg-0pky" onclick="togCell('red', 'automobile')"><img src="css/automobile.png" alt="automobile"
                      height="42" width="42"></th>
                  <th class="tg-0pky" onclick="togCell('red', 'automobileGreen')"><img src="css/automobileGreen.png"
                      alt="automobile" height="42" width="42"></th>
                  <th class="tg-0pky" onclick="togCell('red', 'automobileRed')"><img src="css/automobileRed.png" alt="automobile"
                      height="42" width="42"></th>
                  <th class="tg-0lax" onclick="togCell('red', 'backpack')"><img src="css/backpack.png" alt="automobile"
                      height="42" width="42"></th>
                  <td class="tg-0lax" onclick="togCell('red', 'buses')"><img src="css/buses.png" alt="automobile"
                      height="42" width="42"></td>
                  <td class="tg-0lax" onclick="togCell('red', 'carBlue')"><img src="css/carBlue.png" alt="automobile"
                      height="42" width="42"></td>
                </tr>
                <tr>
                  <td class="tg-0lax" onclick="togCell('red', 'cycle')"><img src="css/cycle.png" alt="automobile"
                      height="42" width="42"></td>
                  <td class="tg-0lax" onclick="togCell('red', 'deliver-truck')"><img src="css/delivery-truck.png" alt="automobile"
                      height="42" width="42"></td>
                  <td class="tg-0lax" onclick="togCell('red', 'delivery-truckBlue')"><img src="css/delivery-truckBlue.png"
                      alt="automobile" height="42" width="42"></td>
                  <td class="tg-0lax" onclick="togCell('red', 'derrick')"><img src="css/derrick.png" alt="automobile"
                      height="42" width="42"></td>
                  <td class="tg-0lax" onclick="togCell('red', 'diamond')"><img src="css/diamond.png" alt="automobile"
                      height="42" width="42"></td>
                  <td class="tg-0lax" onclick="togCell('red', 'goods')"><img src="css/goods.png" alt="automobile"
                      height="42" width="42"></td>
                  <td class="tg-0lax" onclick="togCell('red', 'lift')"><img src="css/lift.png" alt="automobile" height="42"
                      width="42"></td>
                </tr>
                <tr>
                  <td class="tg-0lax" onclick="togCell('red', 'motor-sports')"><img src="css/motor-sports.png" alt="automobile"
                      height="42" width="42"></td>
                  <td class="tg-0pky" onclick="togCell('red', 'motorbiking')"><img src="css/motorbiking.png" alt="automobile"
                      height="42" width="42"></td>
                  <td class="tg-0pky" onclick="togCell('red', 'orangetruck')"><img src="css/orangetruck.png" alt="automobile"
                      height="42" width="42"></td>
                  <td class="tg-0pky" onclick="togCell('red', 'suv')"><img src="css/suv.png" alt="automobile" height="42"
                      width="42"></td>
                  <td class="tg-0pky" onclick="togCell('red', 'taxi')"><img src="css/taxi.png" alt="automobile" height="42"
                      width="42"></td>
                  <td class="tg-0lax" onclick="togCell('red', 'trucking')"><img src="css/trucking.png" alt="automobile"
                      height="42" width="42"></td>
                  <td class="tg-0lax"></td>
                </tr>
              </table>
              <span style="vertical-align:top">
                <font size=2 color="black">Device Id:</font>
                <input readonly name="editCnName" type="text" value="<% =localName %>" id="editCnName" style="TEXT-ALIGN: left; width: 66px;"
                  autocomplete="off">
                <span style="vertical-align:top">
                  <font size=2 color="black">Password:</font>
                  <input name="editCnPWbox" type="text" value="<% =grpPassword %>" id="editCnPWbox" style="TEXT-ALIGN: left; width: 66px;"
                    autocomplete="off">
                </span>
                <input type="text" name="editCnData" id="editCnData" value="automobile" style="display:none">
                <input type="submit" name="editCnButton" value="Set" id="editCnButton" style="height:26px;width:103px;"
                  onclick="javascript:sendCnData

('inline1');return false;">
            </form>
  </center>
  <script type="text/javascript">
    function DisplayInstruction() {

      var buttontext = document.getElementById('<%= Button2.ClientID %>').value;
      if (buttontext == "GeoFence") {
        alert('Select Geofence Tab. \\n Enter address, click find. \\n Select the drawing tool, drag the box over the desired area. \\n Enter an email address or phone number with the +1 Area Code Prefix, then enter the password 0000. \\n Select the fence type, then click SET!');
      }
      if (buttontext == "Set") {
        alert('Double-click 2 points to draw the fence.  \\n Enter an email (or phone with \'+ \' prefix),  password.\\n Select the fence type, then click SET.\\n Click todays date on calendar to cancel.');
      }
    }
    getBatteryImage();
    var rgeoURL = "<% =serverURL %>";

    var viewportheight = document.body.clientHeight;
    var viewportwidth = document.body.clientWidth;
    if (viewportwidth == undefined || viewportwidth == null || viewportheight == undefined || viewportheight == null) {
      viewportwidth = 1200;
      viewportheight = 660;
    }
    if (viewportheight < 660) viewportheight = 660;

    var oMapdiv = new getObj('map');//this is the map div
    oMapdiv.style.width = viewportwidth - 25;
    oMapdiv.style.height = viewportheight;// - 125;
    function popUpWindow(url, name, width, height, left, top, status, scrollbars) {
      if ((left == null) || (top == null) || (status == null) || (scrollbars == null)) {
        var left = 130
        var top = 1
        var status = "no"
        var scrollbars = "no";
      }
      var var_popWindow = window.open(url, name, "menubar=no,toolbar=no,location=no,directories=0,"
        + "status=" + status + ",titlebar=no,"
        + "width=" + width + ",height=" + height + ","
        + "scrollbars=" + scrollbars + ",resizable=no,copyhistory=0,"
        + "hotkeys=0,screenx=0,screeny=0,left=" + left + ",top=" + top);
      var_popWindow.focus();
    }
    function getObj(name) {
      if (document.getElementById) {
        this.obj = document.getElementById(name);
        this.style = document.getElementById(name).style;
      }
      else if (document.all) {
        this.obj = document.all[name];
        this.style = document.all[name].style;
      }
    }


    var ltlong = [];
    var gRCpnts = [];
    var lineCoords = [];
    var grpMbrs = [];
    var fences = [];
    var infowindow = null;

    //rightClick DX vars:
    var got2 = new Boolean();
    got2 = "false";
    var index1 = 999;
    var index2 = 999;
    var d1 = new Date();
    var d2 = new Date();
    var Rm = 3961; // mean radius of the earth (miles) at 39 degrees from the equator
    var Rk = 6373; // mean radius of the earth (km) at 39 degrees from the equator

    var fenceRect = null;//cuz we only have 1 at a time on the map
    var trafficLayer = new google.maps.TrafficLayer();

 
<% =stS %>
      function popUpWindow(url, name, width, height, left, top, status, scrollbars) {
        if ((left == null) || (top == null) || (status == null) || (scrollbars == null)) {
          var left = 130
          var top = 1
          var status = "no"
          var scrollbars = "no";
        }
        var var_popWindow = window.open(url, name, "menubar=no,toolbar=no,location=no,directories=0,"
          + "status=" + status + ",titlebar=no,"
          + "width=" + width + ",height=" + height + ","
          + "scrollbars=" + scrollbars + ",resizable=no,copyhistory=0,"
          + "hotkeys=0,screenx=0,screeny=0,left=" + left + ",top=" + top);
        var_popWindow.focus();
      }
    function getObj(name) {
      if (document.getElementById) {
        this.obj = document.getElementById(name);
        this.style = document.getElementById(name).style;
      }
      else if (document.all) {
        this.obj = document.all[name];
        this.style = document.all[name].style;
      }
    }

    //================================right click=================================

    function calcRC(myIndex) {
      //alert(myIndex + ": " + gRCpnts[myIndex]);
      var temp = gRCpnts[myIndex].split("|");//HH:mm:ss|lat|lon
      if (got2 == "false") {
        index1 = parseFloat(myIndex);//Id and index
        d1.setTime(temp[0]);//time
        index2 = 999;
        got2 = "true";//flag so next click gets saved to second set of vars and processed.
      } else {//2nd click processed here
        index2 = parseFloat(myIndex);
        d2.setTime(temp[0]);
        got2 = "false";	//flag re-set
        //get the time diff in min between index 1 and 2
        var totalMin = Math.abs((d1 - d2) / (1000 * 60));
        var minStr = ""
        if (totalMin < 1) {
          minStr = parseInt(totalMin * 60) + " seconds"
        }
        else if (totalMin > 60) {
          minStr = (totalMin / 60).toFixed(1) + " hours"
        }
        else {
          minStr = totalMin.toFixed(1) + " minutes"
        }
        //get the distance from all the PP between (inclusive)
        var x;
        var y;
        var DX = 0;
        if (index1 < index2) {
          x = index1;
          y = index2;
        } else {
          x = index2;
          y = index1;
        }
        while (x < y) {
          var tmp = gRCpnts[x].split("|");
          var lat1 = tmp[1];
          var lon1 = tmp[2];
          tmp = gRCpnts[x + 1].split("|");
          lat2 = tmp[1];
          lon2 = tmp[2];
          var aTest = findDistance(lat1, lon1, lat2, lon2)
          if (parseFloat(aTest) > 0) {
            DX = DX + aTest;
          }
          x++;
        }

        if (document.getElementById("dxMode").value == "km") {
          var spd = DX * (60 / totalMin);
          alert("Time: " + minStr + "\nDistance: " + DX.toFixed(1) + " km\nSpeed: " + parseInt(spd) + " kph");
        } else {
          DX = DX / 1.6
          var spd = DX * (60 / totalMin);
          alert("Time: " + minStr + "\nDistance: " + DX.toFixed(1) + " miles\nSpeed: " + parseInt(spd) + " mph");
        }
      }

    }


    function findDistance(t1, n1, t2, n2) {
      // convert coordinates to radians
      lat1 = deg2rad(t1);
      lon1 = deg2rad(n1);
      lat2 = deg2rad(t2);
      lon2 = deg2rad(n2);
      // find the differences between the coordinates
      dlat = lat2 - lat1;
      dlon = lon2 - lon1;
      // here's the heavy lifting
      a = Math.pow(Math.sin(dlat / 2), 2) + Math.cos(lat1) * Math.cos(lat2) * Math.pow(Math.sin(dlon / 2), 2);
      //c  = 2 * Math.atan(Math.sqrt(a),Math.sqrt(1-a)); // great circle distance in radians
      c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a)); // great circle distance in radians
      dm = c * Rm; // great circle distance in miles
      dk = c * Rk; // great circle distance in km
      // round the results down to the nearest 1/1000
      mi = round(dm);
      km = round(dk);
      return km;
    }

    /* convert degrees to radians */
    function deg2rad(deg) {
      rad = deg * Math.PI / 180; // radians = degrees * pi/180
      return rad;
    }
    /* round to the nearest 1/10 */
    function round(x) {
      r = Math.round(x * 1000) / 1000;
      return r;
    }
    //==================end rightClick===========================================

    window.onload = InitializeMap;
    drawSpeedo();
    plotDirection();
    ID = window.setTimeout("startTime();", document.getElementById("TextBox1").value * 1000)
    function startTime() {
      if (document.getElementById("reFresh").checked == true) {
        var myURL = "http://" + window.location.host + window.location.pathname + "?name=" + document.getElementById("Label1").innerHTML + "&Gzoom=" +

          document.getElementById("myZoom").value + "&gpasswd=" + document.getElementById("gPwd").value + "&mStyle=" + document.getElementById("mStyle").value +

          "&PPON=" + document.getElementById("CheckBox1").checked
        window.location.href = myURL
      }
      ID = setTimeout("startTime();", document.getElementById("TextBox1").value * 1000)
    }
    //display batter level
    var charge = document.getElementById("lastBattVal").value;
    if (charge > 0) {
      var grnDiv = document.getElementById("battGrn");
      var redDiv = document.getElementById("battRed");
      grnDiv.style.width = charge + "%";
      redDiv.style.width = (100 - charge) + "%";
      redDiv.style.backgroundColor = "red";
    }
  </script>
  </form>
  </div>
  </div>
  </div>

</body>

</html>