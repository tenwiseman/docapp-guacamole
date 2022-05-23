<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:strip-space elements="*"/>
<xsl:output method="xml" indent="yes" encoding="UTF-8"/>

<!--
  tenwiseman : May 2022
  
  This transform adds a "RemoteIPValve" to Tomcat's server.xml

  The following "ProxyRegExp" parameter should be a regular
  expression that matches the docker network internal subnet
-->

<xsl:param name="ProxyRegExp"
	select="'10\.68\.5\.d{1,3}'" />



<xsl:template match="/">
	<xsl:apply-templates/>
</xsl:template>

<xsl:template match="node() | @*">
	<xsl:copy>
		<xsl:apply-templates select="node() | @*" />
	</xsl:copy>
</xsl:template>

<xsl:template match="Server/Service/Engine/Host">
	<xsl:copy>
		<xsl:apply-templates/>
		<xsl:comment> Added by tenwiseman's RemoteIpValve.xslt script
         For further details see https://guacamole.apache.org/doc/gug/reverse-proxy.html </xsl:comment>
		<Valve className="org.apache.catalina.valves.RemoteIpValve"
			internalProxies="{$ProxyRegExp}"
			remoteIpHeader="x-forwarded-for"
			remoteIpProxiesHeader="x-forwarded-by"
			protocolHeader="x-forwarded-proto" />
	</xsl:copy>
</xsl:template>

</xsl:stylesheet>



