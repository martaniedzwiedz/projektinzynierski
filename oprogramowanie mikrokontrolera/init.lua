--init.lua
print("Setting up wi-fi")
wifi.setmode(wifi.STATION)


station_cfg={}
station_cfg.ssid="AP_Niedzwiedz"
station_cfg.pwd="80393276"
wifi.sta.config(station_cfg)
wifi.sta.connect()




tmr.alarm(1, 5000, tmr.ALARM_AUTO, 
function() 
    if wifi.sta.getip()== nil then 
       print(" IP unaviable, Waiting...") 
    else 
        
       tmr.stop(1)
        print("Config done, IP is "..wifi.sta.getip());
      
       http.get("http://zlotastajnia.boo.pl/add-podajnik.php?a=kaatastrofa3&b=0&c=0", nil, function(code, data)
        --http://zlotastajnia.prv.pl/add-podajnik.php?a=mmmmartusia&b=0
          if (code < 0) then
               print("HTTP request failed")
          else
               print(code, data)
                
             end
        end)
       
       function measure_avg()end 
        function recive_time() end
       sntp.sync("pool.ntp.org", function(sec, usec, server, info) rtctime.set(sec + 3600) end, sntp_sync_time, 1)
       dofile('main.lua')
       --print(string.format("%04d/%02d/%02d %02d:%02d:%02d", tm["year"], tm["mon"], tm["day"], tm["hour"], tm["min"], tm["sec"]))
     
    end 
 end)






