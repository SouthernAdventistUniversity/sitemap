<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
                xmlns:sitemap="https://www.sitemaps.org/schemas/sitemap/0.9"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title>Sitemap</title>
                <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
                <style type="text/css">
                    body {
                        font-family: sans-serif;
                        font-size: 1em;
                        color: #545353;
                    }

                    table {
                        border: none;
                        border-collapse: collapse;
                    }

                    #sitemap tr:nth-child(even) {
                        background-color: #eee;
                    }

                    #sitemap tbody tr:hover {
                        background-color: #ccc;
                    }

                    #sitemap tbody tr:hover td, #sitemap tbody tr:hover td a {
                        color: #000;
                    }

                    #content {
                        margin-block: 3rem;
                        margin-inline: auto;
                        max-width: 1000px;
                    }

                    table {
                        width: 100%;
                    }

                    p {
                        margin: 18px 3px;
                        line-height: 0.7em;
                    }

                    p a {
                        color: #da3114;
                        font-weight: bold;
                    }

                    p a:visited {
                        color: #da3114;
                    }

                    a {
                        color: #000;
                        text-decoration: none;
                    }

                    a:hover {
                        text-decoration: underline;
                    }

                    td {
                        font-size: .9em;
                        min-width: 115px;
                        padding-block: .25rem;
                    }

                    th {
                        text-align: left;
                        padding-right: 30px;
                        font-size: 11px;
                    }

                    thead th {
                        border-bottom: 1px solid #000;
                    }
                </style>
            </head>
            <body>
                <div id="content">
                    <h1>Southern Adventist University's XML Sitemap</h1>
                    <p>
                        This XML Sitemap contains
                        <xsl:value-of select="count(sitemap:urlset/sitemap:url)"/>
                        URLs.
                    </p>
                    <table id="sitemap" cellpadding="3">
                        <thead>
                            <tr>
                                <th>URL</th>
                                <xsl:if test="count(sitemap:priority) &lt; 0">
                                    <th title="Index Priority">Prio</th>
                                </xsl:if>
                                <xsl:if test="count(sitemap:changefreq) &lt; 0">
                                    <th title="Change Frequency">Ch. Freq.</th>
                                </xsl:if>
                                <th title="Last Modification Time">Last Mod.</th>
                            </tr>
                        </thead>
                        <tbody>
                            <xsl:variable name="lower" select="'abcdefghijklmnopqrstuvwxyz'"/>
                            <xsl:variable name="upper" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'"/>
                            <xsl:for-each select="sitemap:urlset/sitemap:url">
                                <tr>
                                    <td>
                                        <xsl:variable name="itemURL">
                                            <xsl:value-of select="sitemap:loc"/>
                                        </xsl:variable>
                                        <a href="{$itemURL}" target="_blank">
                                            <xsl:value-of select="sitemap:loc"/>
                                        </a>
                                    </td>
                                    <xsl:if test="count(sitemap:priority) &lt; 0">
                                        <td>
                                            <xsl:value-of select="concat(sitemap:priority*100,'%')"/>
                                        </td>
                                    </xsl:if>
                                    <xsl:if test="count(sitemap:changefreq) &lt; 0">
                                        <td>
                                            <xsl:value-of
                                                    select="concat(translate(substring(sitemap:changefreq, 1, 1),concat($lower, $upper),concat($upper, $lower)),substring(sitemap:changefreq, 2))"/>
                                        </td>
                                    </xsl:if>
                                    <td>
                                        <xsl:value-of
                                                select="concat(substring(sitemap:lastmod,0,11),concat(' ', substring(sitemap:lastmod,12,5)))"/>
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </tbody>
                    </table>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
