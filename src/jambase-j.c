/* Generated by mkjambase from Jambase */
const char *jambase[] = {
/* Jambase-j */
"if $(UNIX) {\n",
"DOT		default	= . ;\n",
"DOTDOT		default	= .. ;\n",
"SLASH		default = / ;\n",
"} else if $(NT) || $(OS2) {\n",
"DOT		default	= . ;\n",
"DOTDOT		default	= .. ;\n",
"SLASH		default = \\\\ ;\n",
"} else if $(VMS) {\n",
"DOT		default	= [] ;\n",
"DOTDOT		default	= [-] ;\n",
"SLASH		default = . ;\n",
"} else if $(MAC) {\n",
"DOT		default = \":\" ;\n",
"DOTDOT		default = \"::\" ;\n",
"SLASH		default = \":\" ;\n",
"}\n",
"ROOT_JAMBASE = $(JAM_PROCESS_PATH)$(SLASH)$(DOTDOT)$(SLASH)Jambase.jam ;\n",
"JAMBASE ?= Jambase.jam ;\n",
"SEARCH on $(JAMBASE) =\n",
"$(DOT)\n",
"$(JAM_PROCESS_PATH)\n",
"$(JAM_PROCESS_PATH)$(SLASH)$(DOTDOT)\n",
";\n",
"include $(JAMBASE) ;\n",
0 };
