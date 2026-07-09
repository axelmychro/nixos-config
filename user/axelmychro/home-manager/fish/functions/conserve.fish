function conserve
    set -l _target_file '/sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode'

    if not test -f "$_target_file"
        log "Conservation mode path not found. Is ideapad_acpi module loaded?"
        return 1
    end

    set -l _conserve_status (cat "$_target_file")

    if test "$_conserve_status" -eq 0
        echo 1 | sudo tee "$_target_file" >/dev/null
        log "Battery conservation mode is now ENABLED! It will charge to around 80%!!"
    else
        echo 0 | sudo tee "$_target_file" >/dev/null
        log "Battery conservation mode is now DISABLED! It will charge to full capacity!!"
    end
end
