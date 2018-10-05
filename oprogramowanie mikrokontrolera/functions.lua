function mierzPodajnik(pin_trig, pin_echo)
    time_start = 0
    time_end = 0
    pin_trig = 4 --gpio2
    pin_echo = 3 --gpio0
    gpio.mode(pin_trig, gpio.OUTPUT)
    gpio.mode(pin_echo, gpio.INPUT)
 
    gpio.write(pin_trig, gpio.LOW)
    tmr.delay(100000)
    gpio.write(pin_trig, gpio.HIGH)
    tmr.delay(10)
    gpio.write(pin_trig, gpio.LOW)
 
    while gpio.read(pin_echo) == 0 do
 
    end
    time_start = tmr.now()
 
    while gpio.read(pin_echo) == 1 do
 
    end
    time_end = tmr.now()
 
    time_duration = time_end - time_start
    print (time_duration/58)
    return time_duration / 58
end

function measure_avg()
    i=0;
    distance=0
    sum=0
    while i < 10 do
    distance= mierzPodajnik()
    sum=sum+distance
    i=i+1
   -- print(sum)
    end
    
    sum=(sum*100)/(10*300)
    
   notify_measure(sum)
end

function servo(dawka)
servo_pin = 5  --gpio14
servo_delay=dawka*10000000
pwm.setup(servo_pin, 50, 71)

pwm.setduty(servo_pin, 27); pwm.start(servo_pin); tmr.delay(500000); pwm.stop(servo_pin)

tmr.delay(servo_delay)
pwm.setduty(servo_pin, 123); pwm.start(servo_pin); tmr.delay(500000); pwm.stop(servo_pin)
end

function notify_measure(data)
print(data)
http.get("http://zlotastajnia.boo.pl/updatestan.php?a="..data.."&b=mammamia",nil, function(code, data)
--http://zlotastajnia.prv.pl/updatestan.php?a="..data.."&b=mammamia
   if (code < 0) then
     print("HTTP request failed")
        else
        print(code, data)
   end
end)
end

function recive_time()
        http.get("http://zlotastajnia.boo.pl/giveTime.php?a=kon", nil, function(code, data)
       -- http://zlotastajnia.prv.pl/giveTime.php?a=zlotastajnia
             if (code < 0) then
                  print("HTTP request failed")
             else
                    --print(code, data)
                   t = sjson.decode(data)
                 -- for k,v in pairs(t) do print(k,v) end 
                                     
                 --   s[1]=string.sub(t.sniadanie_godzina, 1,2)
                   -- s[2]=string.sub(t.sniadanie_godzina, 4,5)
                    --o[1]=string.sub(t.obiad_godzina, 1,2)
                   -- o[2]=string.sub(t.obiad_godzina, 4,5)
                    --k[1]=string.sub(t.kolacja_godzina, 1,2)
                    sniadanie_godzina=string.sub(t.kolacja_godzina, 1,2)
                    sniadanie_minuta=string.sub(t.kolacja_godzina, 4,5)
                    obiad_godzina=string.sub(t.kolacja_godzina, 1,2)
                    obiad_minuta=string.sub(t.kolacja_godzina, 4,5)
                    kolacja_godzina=string.sub(t.kolacja_godzina, 1,2)
                    kolacja_minuta=string.sub(t.kolacja_godzina, 4,5)
                    
                    print(kolacja_godzina)
                    
             end
        end)
end

function time()
tm = rtctime.epoch2cal(rtctime.get())
print(string.format("%04d/%02d/%02d %02d:%02d:%02d", tm["year"], tm["mon"], tm["day"], tm["hour"], tm["min"], tm["sec"]))
--if tm["min"]==00 then
--print('super')
--else 
--print(t.sniadanie_godzina)
--print(t.obiad_godzina)
--print(t.kolacja_godzina)
--end
end

