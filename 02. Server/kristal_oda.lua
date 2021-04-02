-- Author: Bahadýr Bozdað || Cosby || Kioshima

quest kristal_oda begin
	state start begin
		function secmeli(gelen)
			local KANAL = 2
			local giden,_gets = false, game.get_event_flag("secmeli_kanal")
			if _gets > 0 then KANAL = _gets end
			if gelen == KANAL then giden = true end
			return giden
		end
		when logout begin
			if pc.get_map_index() == 208 then
			pc.delqf("icerdesin1")
			pc.delqf("icerdesin2")
			end
		end
		when 30121.chat."Ejderhayý öldürmek istiyorum!" with pc.get_map_index() == 73 begin
			if pc.get_channel_id() == 3 or pc.get_channel_id() == 4 then
				local saniyekalan1 = (game.get_event_flag("time_11") - get_time())
				local dakikakalan1 = math.ceil(saniyekalan1 / 60)    
				local saniyekalan2 = (game.get_event_flag("time_12") - get_time())
				local dakikakalan2 = math.ceil(saniyekalan2 / 60)    
				say_title("Sura Ruhu:")
				say("")
				say("Þuan ejderha odasýna gireceðin aktif kanallar:")	
				if game.get_event_flag("ejder_kullanimda1") != 0 and dakikakalan1 > 0 then
					say_kirmizi("CH1:Ejderha odasý (Dolu)")
				else
					say_yesil("CH1:Ejderha odasý (Boþ)")
				end
				if game.get_event_flag("ejder_kullanimda2") != 0 and dakikakalan2 > 0 then
					say_kirmizi("CH2:Ejderha odasý (Dolu)")
				else
					say_yesil("CH2:Ejderha odasý (Boþ)")
				end
				say_reward("CH3:Ejderha odasýna giriþler kapalý.")		
				say_reward("CH4:Ejderha odasýna giriþler kapalý.")		
				say_reward("CH5:Ejderha odasýna giriþler kapalý.")	
				say_reward("CH6:Ejderha odasýna giriþler kapalý.")	
				say("")
				return
			end
			-----------------------------------------------------
			if game.get_event_flag("ejder_kullanimda"..pc.get_channel_id().."") == 2 and game.get_event_flag("time_1"..pc.get_channel_id().."") - get_time() > 0 then
				say_title("Sura Ruhu:")
				say("")
				say("Üzgünüm Ejderha Tapýnaðý þuan dolu.")
				say("Ýçerideki grubun çýkmasýný beklemelisin.")
				local saniyekalan = (game.get_event_flag("time_1"..pc.get_channel_id().."") - get_time())
				local dakikakalan = math.ceil(saniyekalan / 60)    
				say_yellow("Kalan süre: "..dakikakalan.." dakika")
				say("")
				return
			end
			if game.get_event_flag("time_1"..pc.get_channel_id().."") - get_time() < 0 and game.get_event_flag("ejder_kullanimda"..pc.get_channel_id().."") >= 1 then
				game.set_event_flag("ejder_kullanimda"..pc.get_channel_id().."",0)
				game.set_event_flag("ejder_lonca"..pc.get_channel_id().."",0)
				purge_area(829200,1059600,844200,1074600)
				---warp_all_in_map(79,180100,1220400)
				warp_all_to_village(208)
				setskin(NOWINDOW)
				return
			end
			if game.get_event_flag("ejder_kullanimda"..pc.get_channel_id().."") == 0 and pc.count_item(30179) < 3 then
				say_title("Sura Ruhu:")
				say("Gerekli eþya 3x: "..item_name(30179)..":")
				say_item_vnum(30179)
				say("3 adet anahtara ihtiyacýn var.")
				return
			end
			if game.get_event_flag("ejder_kullanimda"..pc.get_channel_id().."") == 1 then
					pc.setqf("ejder_bug_engel2",get_time()+10)
					say_title("Sura Ruhu:")
					say("Üzgünüm Ejderha Tapýnaðý þuan dolu.")
					say("Eðer þifreyi biliyorsan,")
					say("doðru bir þekilde yaz.")
					say("")
					say_reward("10 saniye süren var!")
					say("")
					local sifre = tonumber(input(""))
					if get_time() > pc.getqf("ejder_bug_engel2") then
						say_title("Sura Ruhu:")
						say("10 saniye doldu þansýný tekrar dene.")
						pc.setqf("ejder_bug_engel2",get_time()+0)
						return
					end
					if game.get_event_flag("ejder_sifresi"..pc.get_channel_id().."") == sifre then
						say_title("Sura Ruhu:")
						say("")
						if pc.count_item(30179) < 3 then
							say("Girmene izin veremem.")
							say("Gerekli eþya 3x: "..item_name(30179)..":")
							say_item_vnum(30179)
							say("3 tane anahtara sahip olduðunda tekrar gel.")
							return
						end
						pc.remove_item("30179",3)
						say("Þifre doðru tebrikler!")
						say("Seni içeri gönderiyorum. Onu yenmeden dönme!")
						pc.setqf("icerdesin"..pc.get_channel_id().."",1)
						pc.setqf("ejder_bug_engel33",get_time()+10)
						wait()
						if get_time() > pc.getqf("ejder_bug_engel33") then
							say_title("Sura Ruhu:")
							say("10 saniye doldu þansýný tekrar dene.")
							pc.setqf("ejder_bug_engel33",get_time()+0)
							return
						end
						pc.warp(843600,1066900)
					elseif sifre != game.get_event_flag("ejder_sifresi"..pc.get_channel_id().."") then
						say_title("Sura Ruhu:")
						say("Üzgünüm þifreyi hatalý girdin.")
						return
					end
					
			end
			local durum = kristal_oda.secmeli(pc.get_channel_id())
			if not durum then
				if game.get_event_flag("ejder_kullanimda"..pc.get_channel_id().."") == 0 and pc.count_item(30179) >= 3 then
					say_title("Sura Ruhu(CH1):")
						say("Ejderha Tapýnaðý'na girmek isteyen ilk kiþi")
						say("sensin. Yeterli sayýda Kývrýk Anahtara sahipsen")
						say("seni içeri býrakacaðým. Ama ilk önce bir þifre")
						say("belirleyeceksin. Bu þifreyi, 5 dakika")
						say("içerisinde savaþ arkadaþlarýna verip onlarýn")
						say("içeri girmesini saðlayabilirsin. Bu anahtarýn")
						say("sadece 30 dakika tesir edeceðini unutma. O zamana")
						say("kadar ejderhayý öldürmüþ olmanýz gerekiyor!")
						say("")
						pc.setqf("ejder_bug_engel3",get_time()+10)
						local sans,i
						if game.get_event_flag("ejderbotkontrol") == 0 then
							sans = number(1,3)
							if sans == 1 then
								i = select("Onaylýyorum", "Vazgeç ", "Düþünücem ")
							elseif sans == 2 then
								i = select("Istemiyorum", "Evet istiyorum ", "Vazgeç ")
							elseif sans == 3 then
								i = select("Vazgeç ", "Belki ", "Girmek istiyorum ")
							end
						end
						if get_time() > pc.getqf("ejder_bug_engel3") then
							say_title("Sura Ruhu:")
							say("10 saniye doldu þansýný tekrar dene.")
							pc.setqf("ejder_bug_engel3",get_time()+0)
							return
						end
						if i == sans and game.get_event_flag("ejder_kullanimda"..pc.get_channel_id().."") == 0 then
							pc.setqf("ejder_bug_engel2",get_time()+10)
							say_title("                                         Sura Ruhu:")
							say("")
							local sayi1 = number(1,9)
							local sayi2 = number(1,9)
							local sayi3 = number(1,9)
							local sayi4 = number(1,9)
							local sayi5 = number(1,9)
							local sayi6 = number(1,9)
							local pin = tonumber(""..sayi1..""..sayi2..""..sayi3..""..sayi4..""..sayi5..""..sayi6.."")
							addimage ( 124 , 90 , "arkaplan"..number(1,6)..".tga" ) 
							addimage ( 124+47 , 90 , "arkaplan"..number(1,6)..".tga" ) 
							addimage ( 126 , 92 , ""..sayi1..".tga" ) 
							addimage ( 143 , 92 , ""..sayi2..".tga" ) 
							addimage ( 156 , 92 , ""..sayi3..".tga" ) 
							addimage ( 170 , 92 , ""..sayi4..".tga" ) 
							addimage ( 182 , 92 , ""..sayi5..".tga" ) 
							addimage ( 195 , 92 , ""..sayi6..".tga" ) 
							local rando2 = pc.getqf("random2")
							if rando2 == 0 then
								say_sari("                                  Yazman gereken þifre :")
								say_sari("                                    10 saniye süren var!")
								say()
								say()
								say()
								say()
								pc.setqf("random2",1)
							elseif rando2 == 1 then
								say_sari("                                  Yazman gereken þifre :")
								say_sari("                                    10 saniye süren var!")
								say()
								say()
								say()
								say()
								pc.setqf("random2",0)
							end
							local sifre = tonumber(input())
							if sifre == nil then
								say_title("Sura Ruhu:")
								say("Üzgünüm þifreyi hatalý girdin.")
								return
							end
							if sifre < 100000 or sifre > 999999 or sifre == nil then
								say_title("Sura Ruhu:")
								say("Üzgünüm þifreyi hatalý girdin.")
								return
							end
							if get_time() > pc.getqf("ejder_bug_engel2") then
								say_title("Sura Ruhu:")
								say("10 saniye doldu þansýný tekrar dene.")
								pc.setqf("ejder_bug_engel2",get_time()+0)
								return
							end
							if sifre == pin and pc.count_item(30179)>=3 then
								say_title("Sura Ruhu:")
								say("")
								say("Arzu edersen seni doðrudan Ejderha Maðarasý'na")
								say("götürebilirim. Bana þimdi vermen gerekenler:")
								say("3x:")
								say_item_vnum(30179)
								say_reward("10 saniye süren var!")
								pc.setqf("ejder_bug_engel3",get_time()+10)
								sans = number(1,2)
								local zaxd
								if sans == 1 then
									zaxd = select("Al ve beni içeri býrak!","Vazgeç ", "Bot Kontrol ")
								elseif sans == 2 then
									zaxd = select("Bot Kontrol ","Al ve beni içeri býrak! ", "Vazgeç ")
								end
								if get_time() > pc.getqf("ejder_bug_engel3") then
									say_title("Sura Ruhu:")
									say("10 saniye doldu þansýný tekrar dene.")
									pc.setqf("ejder_bug_engel3",get_time()+0)
									return
								end
								if zaxd != sans then
									return
								elseif zaxd == sans and game.get_event_flag("ejder_kullanimda"..pc.get_channel_id().."") == 0 then
									if game.get_event_flag("ejder_kullanimda"..pc.get_channel_id().."") != 0 then
										syschat("Ejderha odasýna baþka bir grup girdi.")
										return
									end
									if game.get_event_flag("ejder_lonca"..pc.get_channel_id().."") == 0 then
										game.set_event_flag("ejder_lonca"..pc.get_channel_id().."",pc.get_player_id())
									end
									pc.remove_item("30179",3)
									pc.setqf("icerdesin"..pc.get_channel_id().."",1)
									pc.setqf("lider",1)
									pc.setqf("ejder_sifre",pin)
									clear_server_timer("ejderi_kescen"..pc.get_channel_id().."",get_server_timer_arg())
									clear_server_timer("disari_yolluyoz"..pc.get_channel_id().."",get_server_timer_arg())		
									game.set_event_flag("ejder_kullanimda"..pc.get_channel_id().."",1)
									game.set_event_flag("ejder_lonca"..pc.get_channel_id().."",pc.get_player_id())
									game.set_event_flag("ejder_sifresi"..pc.get_channel_id().."",sifre)
									game.set_event_flag("time_1"..pc.get_channel_id().."", get_time()+60*30)
									pc.warp(843600, 1066900)
								elseif zaxd == 1 and game.get_event_flag("ejder_kullanimda"..pc.get_channel_id().."") != 0 then
									say_title("Sura Ruhu:")
									say("")
									say("Birileri senden önce davrandý. Onlarýn")
									say("odadan çýkmalarýný bekle ya da parolayý ")
									say("biliyorsan söyle.")
								end
							elseif sifre == 1 then
								return
							else
								say_title("Sura Ruhu:")
								say("")
								say("Bir hata oluþtu.")
								say("")
						end
					end
				end
			else
				if game.get_event_flag("ejder_kullanimda"..pc.get_channel_id().."") == 0 and pc.count_item(30179) >= 3 then
					say_title("Sura Ruhu(CH2):")
						say("Ejderha Tapýnaðý'na girmek isteyen ilk kiþi")
						say("sensin. Yeterli sayýda Kývrýk Anahtara sahipsen")
						say("seni içeri býrakacaðým. Ama ilk önce bir þifre")
						say("belirleyeceksin. Bu þifreyi, 5 dakika")
						say("içerisinde savaþ arkadaþlarýna verip onlarýn")
						say("içeri girmesini saðlayabilirsin. Bu anahtarýn")
						say("sadece 30 dakika tesir edeceðini unutma. O zamana")
						say("kadar ejderhayý öldürmüþ olmanýz gerekiyor!")
						say("")
						pc.setqf("ejder_bug_engel3",get_time()+10)
						local sans,i
						if game.get_event_flag("ejderbotkontrol") == 0 then
							sans = number(1,3)
							if sans == 1 then
								i = select("Onaylýyorum", "Vazgeç ", "Düþünücem ")
							elseif sans == 2 then
								i = select("Istemiyorum", "Evet istiyorum ", "Vazgeç ")
							elseif sans == 3 then
								i = select("Vazgeç ", "Belki ", "Girmek istiyorum ")
							end
						end
						if get_time() > pc.getqf("ejder_bug_engel3") then
								say_title("Sura Ruhu:")
								say("10 saniye doldu þansýný tekrar dene.")
								pc.setqf("ejder_bug_engel3",get_time()+0)
								return
							end
						if i == sans and game.get_event_flag("ejder_kullanimda"..pc.get_channel_id().."") == 0 then

							pc.setqf("ejder_bug_engel2",get_time()+10)
							say_title("[WINDOW_SIZE width;350|height;400]")
							say_title("                                        Sura Ruhu:")
							local sayi1 = number(1,9)
							local sayi2 = number(1,9)
							local sayi3 = number(1,9)
							local sayi4 = number(1,9)
							local sayi5 = number(1,9)
							local sayi6 = number(1,9)
							local pin1 = number(10000,999999)
							local pin2 = number(10000,999999)
							local pin3 = number(10000,999999)
							local pin4 = number(10000,999999)
							local pin5 = number(10000,999999)
							local pin6 = number(10000,999999)
							local pin7 = number(10000,999999)
							local gercek = number(2,8)
							local pin = tonumber(""..sayi1..""..sayi2..""..sayi3..""..sayi4..""..sayi5..""..sayi6.."")
							if gercek == 2 then
								pin1 = pin
							elseif gercek == 3 then
								pin2 = pin
							elseif gercek == 4 then
								pin3 = pin
							elseif gercek == 5 then
								pin4 = pin
							elseif gercek == 6 then
								pin5 = pin
							elseif gercek == 7 then
								pin6 = pin
							elseif gercek == 8 then
								pin7 = pin
							end
							addimage ( 124 , 90 , "arkaplan"..number(1,6)..".tga" ) 
							addimage ( 124+47 , 90 , "arkaplan"..number(1,6)..".tga" ) 
							addimage ( 126 , 92 , ""..sayi1..".tga" ) 
							addimage ( 143 , 92 , ""..sayi2..".tga" ) 
							addimage ( 156 , 92 , ""..sayi3..".tga" ) 
							addimage ( 170 , 92 , ""..sayi4..".tga" ) 
							addimage ( 182 , 92 , ""..sayi5..".tga" ) 
							addimage ( 195 , 92 , ""..sayi6..".tga" ) 
							local rando = pc.getqf("random")
							if rando == 0 then
								say_sari("                                  Seçmen gereken þifre : ")
								say_sari("                                   10 saniye süren var!")
								say()
								say()
								say()
								say()
								pc.setqf("random",1)
							elseif rando == 1 then
								say_sari("                                  Seçmen gereken þifre : ")
								say_sari("                                   10 saniye süren var!")
								say()
								say()
								say()
								say()
								pc.setqf("random",0)
							end
							--say_reward("Seçmen gereken þifre : "..pins)
							--say_reward("10 saniye süren var!")
							local sifre = select("Vazgeç ",pin1,pin2,pin3,pin4,pin5,pin6,pin7)
							if sifre != gercek then
								say_title("Sura Ruhu:")
								say("Üzgünüm þifreyi hatalý girdin.")
								return
							end
							--if sifre < 10000 or sifre > 99999 or sifre == nil then
								--say_title("Sura Ruhu:")
								--say("Üzgünüm þifreyi hatalý girdin.")
								--return
							--end
							if get_time() > pc.getqf("ejder_bug_engel2") then
								say_title("Sura Ruhu:")
								say("10 saniye doldu þansýný tekrar dene.")
								pc.setqf("ejder_bug_engel2",get_time()+0)
								return
							end
							if sifre == gercek and pc.count_item(30179)>=3 then
								say_title("Sura Ruhu:")
								say("")
								say("Arzu edersen seni doðrudan Ejderha Maðarasý'na")
								say("götürebilirim. Bana þimdi vermen gerekenler:")
								say("3x:")
								say_item_vnum(30179)
								say_reward("10 saniye süren var!")
								pc.setqf("ejder_bug_engel3",get_time()+10)
								local zaxd
								if sans == 1 then
									zaxd = select("Al ve beni içeri býrak!","Vazgeç ", "Bot Kontrol ")
								elseif sans == 2 then
									zaxd = select("Bot Kontrol ","Al ve beni içeri býrak! ", "Vazgeç ")
								end
								if get_time() > pc.getqf("ejder_bug_engel3") then
									say_title("Sura Ruhu:")
									say("10 saniye doldu þansýný tekrar dene.")
									pc.setqf("ejder_bug_engel3",get_time()+0)
									return
								end
								if zaxd != sans then
									return
								elseif zaxd == sans and game.get_event_flag("ejder_kullanimda"..pc.get_channel_id().."") == 0 then
									if game.get_event_flag("ejder_kullanimda"..pc.get_channel_id().."") != 0 then
										syschat("Ejderha odasýna baþka bir grup girdi.")
										return
									end
									if game.get_event_flag("ejder_lonca"..pc.get_channel_id().."") == 0 then
										game.set_event_flag("ejder_lonca"..pc.get_channel_id().."",pc.get_player_id())
									end
									pc.remove_item("30179",3)
									pc.setqf("icerdesin"..pc.get_channel_id().."",1)
									pc.setqf("lider",1)
									pc.setqf("ejder_sifre",pin)
									clear_server_timer("ejderi_kescen"..pc.get_channel_id().."",get_server_timer_arg())
									clear_server_timer("disari_yolluyoz"..pc.get_channel_id().."",get_server_timer_arg())		
									game.set_event_flag("ejder_kullanimda"..pc.get_channel_id().."",1)
									game.set_event_flag("ejder_lonca"..pc.get_channel_id().."",pc.get_player_id())
									game.set_event_flag("ejder_sifresi"..pc.get_channel_id().."",pin)
									game.set_event_flag("time_1"..pc.get_channel_id().."", get_time()+60*30)
									pc.warp(843600, 1066900)
								elseif zaxd == 1 and game.get_event_flag("ejder_kullanimda"..pc.get_channel_id().."") != 0 then
									say_title("Sura Ruhu:")
									say("")
									say("Birileri senden önce davrandý. Onlarýn")
									say("odadan çýkmalarýný bekle ya da parolayý ")
									say("biliyorsan söyle.")
								end
							elseif sifre == 1 then
								return
							else
								say_title("Sura Ruhu:")
								say("")
								say("Bir hata oluþtu.")
								say("")
						end
					end
				end
			end
		end
		
		when login begin
			if pc.getqf("icerdesin"..pc.get_channel_id().."") == 1 then
				send_letter("Mavi Ejderha'yý maðlup edin")
			end
		end
	
		when button or info begin
			q.set_clock("Kalan süre:", game.get_event_flag("time_1"..pc.get_channel_id().."")-get_time())
			dragonlair.ejder_odasi_kalansure()
		end

		when login with pc.get_map_index() == 208 and pc.getqf("icerdesin"..pc.get_channel_id().."") != 1  begin
			--syschat("Þifre sende olmadýðý için ejderha odasýndan sürgün maðarasý 2.kat baþýna ýþýnlandýn!")
			--if pc.getf("izle.mod") == then
				pc.warp(180100,1220400)
			--end
		end
		
		when login with pc.get_map_index() == 208 and pc.getqf("lider") == 1 begin
			local lonca = game.get_event_flag("ejder_lonca"..pc.get_channel_id().."")
			local id = pc.get_player_id()
			if lonca != id then
				syschat("Þifre sende olmadýðý için ejderha odasýndan sürgün maðarasý 2.kat baþýna ýþýnlandýn!")
				pc.give_item2(30180,1)
				pc.give_item2(30179,3)
				pc.warp(180100,1220400)
				return
			end
			purge_area(829200,1059600,844200,1074600)
			regen_in_map(208,"data/dungeon/skia_deliboss.txt")
			notice_all("CH "..pc.get_channel_id()..": "..pc.get_name().." grubu, Mavi Ejderha'yý öldürmeye çalýþýyor!")
			notice_big(""..pc.getqf("ejder_sifre").." numaralý þifreyi daðýtmaya 5 dakika zamanýn var!")
			server_timer("sifre_kapat"..pc.get_channel_id().."", 300,pc.get_map_index())
			server_timer("ejderi_kescen"..pc.get_channel_id().."", 2880,pc.get_map_index())
			--server_timer("ejderi_kontrol_et_"..pc.get_channel_id().."_1",30,pc.get_map_index())
			dragonlair.ejder_odasi_kalansure()
			pc.setqf("lider",2)
			pc.set_warp_location(73 , 2418, 12747)	
		end
		
		when login with pc.get_map_index() == 208 and pc.getqf("icerdesin"..pc.get_channel_id().."") == 1 and pc.getqf("lider") != 1 begin
			dragonlair.ejder_odasi_kalansure()
			pc.set_warp_location(73 , 2418, 12747)
		end
		
		when login with pc.get_map_index() == 208 begin
			pc.set_warp_location(73 , 2418, 12747)
		end
		
		when kill with pc.get_map_index() == 208 and npc.get_race() == 8031 or npc.get_race() == 8032 or  npc.get_race() == 8033 or npc.get_race() == 8034 begin
		local n =game.get_event_flag("kesilen_metin"..pc.get_channel_id().."") + 1
		game.set_event_flag("kesilen_metin"..pc.get_channel_id().."", n)
			if n > 3 then
			local t = number(1,4)
				if 1 == t then
				regen_in_map(208,"data/dungeon/skia_boss1.txt")
				elseif 2 == t then
				regen_in_map(208,"data/dungeon/skia_boss2.txt")
				elseif 3 == t then
				regen_in_map(208,"data/dungeon/skia_boss3.txt")
				else
				regen_in_map(208,"data/dungeon/skia_boss4.txt")
				end
			end
		end
		
		--[[when ejderi_kontrol_et_1_1.server_timer begin
			if pc.ejder_kontrol(79) == 0 and game.get_event_flag("ejder_oldu") == 0 then
				notice_all("CH1: Ejderha odasýnda kimse kalmadýðý için oda kapatýldý, giriþler açýldý.")
				purge_area(829200,1059600,844200,1074600)
				kill_all_in_map(79)
				clear_server_timer("ejderi_kescen1",get_server_timer_arg())
				clear_server_timer("ejderi_kontrol_et_1_1",get_server_timer_arg())
				clear_server_timer("ejderi_kontrol_et_1_2",get_server_timer_arg())
				game.set_event_flag("ejder_kullanimda1",300)
				game.set_event_flag("ejder_sifre",300)
				game.set_event_flag("time_1_1",300)
				forked.warp_all_in_map("79","73","180100","1220400",1)
			else
				-- notice_all("Ejderha odasýnda "..pc.ejder_kontrol(79).." kiþi var.")
				server_timer("ejderi_kontrol_et_1_2",30)
			end
		end
		
		when ejderi_kontrol_et_1_2.server_timer begin
			if pc.ejder_kontrol(79) == 0 and game.get_event_flag("ejder_oldu") == 0 then
				notice_all("CH1: Ejderha odasýnda kimse kalmadýðý için oda kapatýldý, giriþler açýldý.")
				purge_area(829200,1059600,844200,1074600)
				kill_all_in_map(79)
				clear_server_timer("ejderi_kescen1",get_server_timer_arg())
				clear_server_timer("ejderi_kontrol_et_1_1",get_server_timer_arg())
				clear_server_timer("ejderi_kontrol_et_1_2",get_server_timer_arg())
				game.set_event_flag("ejder_kullanimda1",300)
				game.set_event_flag("ejder_sifre",300)
				game.set_event_flag("time_11",300)
				forked.warp_all_in_map("79","73","180100","1220400",1)
			else
				-- notice_all("Ejderha odasýnda "..pc.ejder_kontrol(79).." kiþi var.")
				server_timer("ejderi_kontrol_et_1_1",30)
			end
		end
		
		
		when ejderi_kontrol_et_2_1.server_timer begin
			if pc.ejder_kontrol(79) == 0 and game.get_event_flag("ejder_oldu") == 0 then
				notice_all("CH2: Ejderha odasýnda kimse kalmadýðý için oda kapatýldý, giriþler açýldý.")
				purge_area(829200,1059600,844200,1074600)
				kill_all_in_map(79)
				clear_server_timer("ejderi_kescen2",get_server_timer_arg())
				clear_server_timer("ejderi_kontrol_et_2_1",get_server_timer_arg())
				clear_server_timer("ejderi_kontrol_et_2_2",get_server_timer_arg())
				game.set_event_flag("ejder_kullanimda2",300)
				game.set_event_flag("ejder_sifre",300)
				game.set_event_flag("time_12",300)
				forked.warp_all_in_map("79","73","180100","1220400",1)
			else
				-- notice_all("Ejderha odasýnda "..pc.ejder_kontrol(79).." kiþi var.")
				server_timer("ejderi_kontrol_et_2_2",30)
			end
		end
		
		when ejderi_kontrol_et_2_2.server_timer begin
			if pc.ejder_kontrol(79) == 0 and game.get_event_flag("ejder_oldu") == 0 then
				notice_all("CH2: Ejderha odasýnda kimse kalmadýðý için oda kapatýldý, giriþler açýldý.")
				purge_area(829200,1059600,844200,1074600)
				kill_all_in_map(79)
				clear_server_timer("ejderi_kescen2",get_server_timer_arg())
				clear_server_timer("ejderi_kontrol_et_2_1",get_server_timer_arg())
				clear_server_timer("ejderi_kontrol_et_2_2",get_server_timer_arg())
				game.set_event_flag("ejder_kullanimda2",300)
				game.set_event_flag("ejder_sifre",300)
				game.set_event_flag("time_12",300)
				forked.warp_all_in_map("79","73","180100","1220400",1)
			else
				-- notice_all("Ejderha odasýnda "..pc.ejder_kontrol(79).." kiþi var.")
				server_timer("ejderi_kontrol_et_2_1",30)
			end
		end]]

		when kill with pc.get_map_index() == 208 and game.get_event_flag("ejder_kullanimda"..pc.get_channel_id().."") >= 1 and npc.get_race() == 2493 begin
			game.drop_item_with_ownership("71123",1)
			game.drop_item_with_ownership("71129",1)
			notice_all("CH "..pc.get_channel_id()..": "..pc.get_name().." grubu, Mavi Ejderha'yý öldürdü!")
			kill_all_in_map(208)
			game.set_event_flag("ejder_oldu",1)
			game.set_event_flag("kesilen_metin"..pc.get_channel_id().."",0)
			clear_server_timer("ejderi_kescen"..pc.get_channel_id().."",get_server_timer_arg())
			server_timer("disari_yolluyoz"..pc.get_channel_id().."",60, pc.get_map_index())
		end
		
		when ejder_bosmu.server_timer begin
			if pc.ejder_kontrol(208) == 0 and game.get_event_flag("ejder_oldu") == 0 then
				notice_all("Mavi Ejderha geri döndü!")
				game.set_event_flag("ejder_kullanimda",0)
				game.set_event_flag("ejder_oldu",1)
				game.set_event_flag("ejder_sifresi",0)
				forked.warp_all_in_map("208","73","241800","1274700",1)
				clear_server_timer("ejder_bosmu",get_server_timer_arg())
			else
			clear_server_timer("ejder_bosmu",get_server_timer_arg())
			end
		end
		
		when sifre_kapat1.server_timer begin
			game.set_event_flag("ejder_kullanimda1",2)
		end
		
		when disari_yolluyoz1.server_timer begin
			notice_all("CH 1: Mavi Ejderha geri döndü!")
			purge_area(829200,1059600,844200,1074600)
			clear_server_timer("ejderi_kescen1",get_server_timer_arg())
			clear_server_timer("sifre_kapat1",get_server_timer_arg())
			game.set_event_flag("ejder_lonca1",0)
			game.set_event_flag("ejder_kullanimda1",0)
			--warp_all_to_village(79)
			forked.warp_all_in_map("208","73","180100","1220400",1)
		end
		
		when ejderi_kescen1.server_timer with game.get_event_flag("time_11") - get_time() <= 0 begin
			notice_all("CH 1: Mavi Ejderha hâlâ yaþýyor!")
			purge_area(829200,1059600,844200,1074600)
			warp_all_to_village(208)
		end	
		
		when sifre_kapat2.server_timer begin
		game.set_event_flag("ejder_kullanimda2",2)
		end
		
		when disari_yolluyoz2.server_timer begin
			notice_all("CH 2: Mavi Ejderha geri döndü!")
			purge_area(829200,1059600,844200,1074600)
			clear_server_timer("ejderi_kescen2",get_server_timer_arg())
			clear_server_timer("sifre_kapat2",get_server_timer_arg())
			game.set_event_flag("ejder_lonca2",0)
			game.set_event_flag("ejder_kullanimda2",0)
			--warp_all_to_village(79)
			forked.warp_all_in_map("208","73","180100","1220400",1)
		end
		
		
		when ejderi_kescen2.server_timer with game.get_event_flag("time_12") - get_time() <= 0 begin
			notice_all("CH 2: Mavi Ejderha hâlâ yaþýyor!")
			purge_area(829200,1059600,844200,1074600)
			warp_all_to_village(208)
		end
		
		when login with pc.get_map_index() != 208 begin
			if pc.getqf("icerdesin1") == 1 or pc.getqf("icerdesin2") == 1 then
			pc.delqf("icerdesin1")
			pc.delqf("icerdesin2")
			pc.delqf("ejder_sifre")
			pc.delqf("lider")
			end
			if pc.getqf("lider") == 1 then
			pc.delqf("lider")
			end
		end
		
		when 30121.chat."Süreyi sýfýrla" with pc.is_gm() begin
			say_title("Sura Ruhu;")
			say("Sýfýrlamak istediðinden emin misin ?")
			local cyvercha = select("Evet","Hayýr")
			if cyvercha == 2 then
				return
			elseif cyvercha == 1 then
				notice_all("CH "..pc.get_channel_id()..": Kristal oda süresi sýfýrlanmýþtýr.")
				game.set_event_flag("time_1"..pc.get_channel_id().."",get_time() + 10)
				clear_server_timer("ejderi_kescen"..pc.get_channel_id().."",get_server_timer_arg())
				server_timer("disari_yolluyoz"..pc.get_channel_id().."",30, pc.get_map_index()) ---300 olcak
				forked.warp_all_in_map("208","73","180100","1220400",295)
			end
		end
		
		function ejder_odasi_kalansure()
            
			local saniyekalan = (game.get_event_flag("time_1"..pc.get_channel_id().."") - get_time())
            local dakikakalan = math.ceil(saniyekalan / 60)
            notice_big("Mavi Ejderha'yý öldürmeye "..dakikakalan.." dakikalýk bir zaman kaldý!")
        
        end	
		
		when 30121.chat."Ejderha Odasý Durumu" with pc.get_map_index() == 73 begin
				local saniyekalan1 = (game.get_event_flag("time_11") - get_time())
				local dakikakalan1 = math.ceil(saniyekalan1 / 60)
				local saniyekalan2 = (game.get_event_flag("time_12") - get_time())
				local dakikakalan2 = math.ceil(saniyekalan2 / 60)
				say_title("Sura Ruhu:")
				say("")
				say("Þuan ejderha odasýna gireceðin aktif kanallar:")
				if game.get_event_flag("ejder_kullanimda1") != 0 and dakikakalan1 > 0 then
					say_green("CH1:Ejderha odasý (Dolu)")
				else
					say_yellow("CH1:Ejderha odasý (Boþ)")
				end
				if game.get_event_flag("ejder_kullanimda2") != 0 and dakikakalan2 > 0 then
					say_green("CH2:Ejderha odasý (Dolu)")
				else
					say_yellow("CH2:Ejderha odasý (Boþ)")
				end
				say_reward("CH3:Ejderha odasýna giriþler kapalý.")
				say_reward("CH4:Ejderha odasýna giriþler kapalý.")
				say_reward("CH5:Ejderha odasýna giriþler kapalý.")
				say_reward("CH6:Ejderha odasýna giriþler kapalý.")
				say("")
				end
			end
		end