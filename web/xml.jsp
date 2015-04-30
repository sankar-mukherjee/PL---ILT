<?xml version="1.0" encoding="UTF-8"?>
 <%@ page contentType="text/xml" pageEncoding="UTF-8"%>
 <%@ page import="form.*" %>
 <jsp:useBean id="portfolio" class="form.fetch" />

<%java.util.Iterator folio = portfolio.getPortfolio();
GenerateXml stock = null;
%>
<!-- This pronunciation lexicon is licensed under the GPL. -->
<lexicon version="1.0" xmlns="http://www.w3.org/2005/01/pronunciation-lexicon" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.w3.org/TR/2007/CR-pronunciation-lexicon-20071212/pls.xsd" alphabet="ipa" xml:lang="bn">
     <% while (folio.hasNext()) { %>
     <% stock = (GenerateXml)folio.next(); %>
<lexeme>
<grapheme><%= stock.getGrapheme() %></grapheme>
<POS><%=   stock.getPos() %></POS>
<phoneme><%=   stock.getPhoneme() %></phoneme>
<meaning><%=   stock.getMeaning() %></meaning>
 <% } %>
</lexeme>
</lexicon>
