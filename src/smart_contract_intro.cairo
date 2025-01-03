



//introduction to smart contracts in cairo

#[starknet::interface]
trait ISimpleStorage<TContractState> {
    fn set(ref self:TContractState, x:u128);
    fn get(self:@TContractState) -> u128;
    fn get_name(self:@TContractState) -> ByteArray;
}

#[starknet::contract]
mod SimpleStorage {
    
    //smart contract must have storage variables
    #[storage]
    struct Storage {
        stored_data:u128,
        name:ByteArray,
    }

    #[abi(embed_v0)]
    impl SimpleStorage of super::ISimpleStorage<ContractState> {
        fn set(ref self:ContractState, x:u128) {
            self.stored_data.write(x);
        }
        fn get(self:@ContractState) -> u128 {
            self.stored_data.read()
        }
        fn get_name(self:@ContractState) -> ByteArray {
            self.name.read();
        }
    }
    
}