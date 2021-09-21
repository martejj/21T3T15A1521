#define READING   0x01
#define WRITING   0x02
#define AS_BYTES  0x04
#define AS_BLOCKS 0x08
#define LOCKED    0x10

int main(void) {

    // Mark the device as locked for reading bytes
    char device = (LOCKED | READING | AS_BYTES);

    // Mark the device as locked for writing blocks
    char device = (LOCKED | WRITING | AS_BYTES);

    // Set the device as locked, leaving other flags unchanged
    device = device | LOCKED;

    // Determine if a device is locked
    char isLocked = device & LOCKED;

    // Remove the lock on a device, leaving other flags unchanged

    // Switch a device to/from reading and writing, leaving other flags unchanged
}