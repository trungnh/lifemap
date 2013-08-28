/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements. See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership. The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License. You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations under the License.
 */

var gadgets = gadgets || {};

gadgets.i18n = gadgets.i18n || {};

gadgets.i18n.DateTimeConstants = {
  ERAS:["v. Chr.","n. Chr."],
  ERANAMES:["v. Chr.","n. Chr."],
  NARROWMONTHS:["J","F","M","A","M","J","J","A","S","O","N","D"],
  MONTHS:["Januar","Februar","M\u00e4rz","April","Mai","Juni","Juli","Auguscht","Sept\u00e4mber","Oktoober","Nov\u00e4mber","Dez\u00e4mber"],
  SHORTMONTHS:["Jan","Feb","M\u00e4r","Apr","Mai","Jun","Jul","Aug","Sep","Okt","Nov","Dez"],
  WEEKDAYS:["Sunntig","M\u00e4\u00e4ntig","Ziischtig","Mittwuch","Dunschtig","Friitig","Samschtig"],
  SHORTWEEKDAYS:["Su.","M\u00e4.","Zi.","Mi.","Du.","Fr.","Sa."],
  NARROWWEEKDAYS:["S","M","D","M","D","F","S"],
  SHORTQUARTERS:["Q1","Q2","Q3","Q4"],
  QUARTERS:["1. Quartal","2. Quartal","3. Quartal","4. Quartal"],
  AMPMS:["vorm.","nam."],
  DATEFORMATS:["EEEE, d. MMMM y","d. MMMM y","dd.MM.yyyy","dd.MM.yy"],
  TIMEFORMATS:["HH:mm:ss zzzz","HH:mm:ss z","HH:mm:ss","HH:mm"],
  FIRSTDAYOFWEEK: 0,
  WEEKENDRANGE: [5, 6],
  FIRSTWEEKCUTOFFDAY: 3
};
gadgets.i18n.DateTimeConstants.STANDALONENARROWMONTHS = gadgets.i18n.DateTimeConstants.NARROWMONTHS;
gadgets.i18n.DateTimeConstants.STANDALONEMONTHS = gadgets.i18n.DateTimeConstants.MONTHS;
gadgets.i18n.DateTimeConstants.STANDALONESHORTMONTHS = gadgets.i18n.DateTimeConstants.SHORTMONTHS;
gadgets.i18n.DateTimeConstants.STANDALONEWEEKDAYS = gadgets.i18n.DateTimeConstants.WEEKDAYS;
gadgets.i18n.DateTimeConstants.STANDALONESHORTWEEKDAYS = gadgets.i18n.DateTimeConstants.SHORTWEEKDAYS;
gadgets.i18n.DateTimeConstants.STANDALONENARROWWEEKDAYS = gadgets.i18n.DateTimeConstants.NARROWWEEKDAYS;
