tmr.alarm(1, 60000, tmr.ALARM_AUTO, 
    function()
    time()
    if tm["hour"] == sniadanie_godzina and tm["min"] == sniadanie_minuta then
                   servo(t.sniadanie_dawka)
                   
   elseif tm["hour"] == obiad_godzina and tm["min"] == obiad_minuta then
                   servo(t.obiad_dawka)
                   
    elseif tm["hour"] == kolacja_godzina and tm["min"] == kolacja_minuta then
                   servo(t.kolacja_dawka)
                   
    end
    
     if wifi.sta.getip()== nil then 
            wifi.setmode(wifi.STATION)
            station_cfg={}
            station_cfg.ssid="AP_Niedzwiedz"
            station_cfg.pwd="80393276"
            wifi.sta.config(station_cfg)
            wifi.sta.connect()
     else
            
         if tm["min"]== 00 then
            recive_time()
            measure_avg()
         end
   end            
               
  end)

