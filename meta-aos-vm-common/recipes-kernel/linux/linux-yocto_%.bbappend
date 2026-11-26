FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += " \
    file://common_node.cfg \
    ${@bb.utils.contains('DISTRO_FEATURES', 'benchmark', 'file://benchmark.cfg', '', d)} \
"

# Paravirtualized KVM guest support (CONFIG_HYPERVISOR_GUEST, CONFIG_PARAVIRT, CONFIG_KVM_GUEST): use kvm-clock as
# clocksource under KVM and VirtualBox (KVM paravirt provider). Without it the guest falls back to hpet/acpi_pm and
# its clock lags behind real time when vCPUs are not scheduled by the host for a while.

KERNEL_FEATURES:append:x86-64 = " cfg/paravirt_kvm.scc"
