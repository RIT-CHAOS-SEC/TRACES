projectDir=../../prv/STM32L5_HAL_TRUSTZONE/

### Secure world
objdump -dz ${projectDir}Secure/Debug/STM32L5_HAL_TRUSTZONE_Secure.elf > objects/Secure.asm.tmp

sed '/>:$/d' objects/Secure.asm.tmp > objects/Secure.tmp
python3 format_words.py objects/Secure.tmp
sed -i 's/ //g' objects/Secure.tmp2
awk '{print $2}' objects/Secure.tmp2 > objects/Secure.mem
sed -i 's/\(.\{2\}\)/\1\n/g' objects/Secure.mem
sed -i '/^$/d' objects/Secure.mem

### Non-Secure world
objdump -dz ${projectDir}NonSecure/Debug/STM32L5_HAL_TRUSTZONE_NonSecure.elf > objects/NonSecure.asm.tmp

sed '/>:$/d' objects/NonSecure.asm.tmp > objects/NonSecure.tmp
python3 format_words.py objects/NonSecure.tmp
sed -i 's/ //g' objects/NonSecure.tmp2
awk '{print $2}' objects/NonSecure.tmp2 > objects/NonSecure.mem
sed -i 's/\(.\{2\}\)/\1\n/g' objects/NonSecure.mem
sed -i '/^$/d' objects/NonSecure.mem

rm objects/*.tmp*
