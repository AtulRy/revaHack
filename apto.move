module my_addrx:: MedicineRegistry{

    public struct Medicine {
        name: vector<u8>,
        expDate: u64,
        price: u64,
    }

    public struct MedicineStorage {
        medicines: vector<Medicine>,
        medicineCount: u64,
    }

    public fun init(): MedicineStorage {
        MedicineStorage {
            medicines: empty<Medicine>(),
            medicineCount: 0,
        }
    }

    public fun createMedicine(
        m: &mut MedicineStorage,
        name: vector<u8>,
        expDate: u64,
        price: u64,
    ) {
        let id: u64 = move_from(expDate) + move_from(m.medicineCount);
        let medicine = Medicine {
            name: (name),
            expDate: (expDate),
            price: (price),
        };
        m.medicines.push_back(move(medicine));
        m.medicineCount = move(m.medicineCount + 1);
    }

    public fun getMedicine(m: &MedicineStorage, id: u64): &Medicine {
        let idx: u64 = id;
        assert(idx < m.medicineCount, 101);
        m.medicines.get_mut(idx)
    }

    public fun checkMedicineExists1(m: &MedicineStorage, id: u64): bool {
        let i: u64 = m.i;
        m.i = move(i + 1);
        return m.medicines[id].expDate != 0;
    }

    public fun checkMedicineExists2(m: &MedicineStorage, id: u64): bool {
        let i: u64 = m.i;
        m.i = move(i + 1);
        return m.medicines[id].price != 0;
    }

    public fun overallcheck(_i: u64): vector<u8> {
        if _i == 2 {
            "correct".to_vector()
        } else {
            "wrong".to_vector()
        }
    }
}
}