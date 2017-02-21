/*
 * DO NOT EDIT.
 *
 * Generated by the protocol buffer compiler.
 * Source: common/configuration.proto
 *
 */

// 
// Copyright IBM Corp. 2016 All Rights Reserved.
// 
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
// http://www.apache.org/licenses/LICENSE-2.0
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import Foundation
import SwiftProtobuf


///   HashingAlgorithm is encoded into the configuration transaction as  a configuration item of type Chain
///   with a Key of "HashingAlgorithm" and a Value of  HashingAlgorithm as marshaled protobuf bytes
struct Common_HashingAlgorithm: SwiftProtobuf.Message, SwiftProtobuf.Proto3Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf.ProtoNameProviding {
  public var swiftClassName: String {return "Common_HashingAlgorithm"}
  public var protoMessageName: String {return "HashingAlgorithm"}
  public var protoPackageName: String {return "common"}
  public static let _protobuf_fieldNames: FieldNameMap = [
    1: .same(proto: "name", swift: "name"),
  ]


  ///   Currently supported algorithms are: SHAKE256
  var name: String = ""

  init() {}

  public mutating func _protoc_generated_decodeField<T: SwiftProtobuf.FieldDecoder>(setter: inout T, protoFieldNumber: Int) throws {
    switch protoFieldNumber {
    case 1: try setter.decodeSingularField(fieldType: SwiftProtobuf.ProtobufString.self, value: &name)
    default: break
    }
  }

  public func _protoc_generated_traverse(visitor: SwiftProtobuf.Visitor) throws {
    if name != "" {
      try visitor.visitSingularField(fieldType: SwiftProtobuf.ProtobufString.self, value: name, fieldNumber: 1)
    }
  }

  public func _protoc_generated_isEqualTo(other: Common_HashingAlgorithm) -> Bool {
    if name != other.name {return false}
    return true
  }
}

///   BlockDataHashingStructure is encoded into the configuration transaction as a configuration item of
///   type Chain with a Key of "BlockDataHashingStructure" and a Value of HashingAlgorithm as marshaled protobuf bytes
struct Common_BlockDataHashingStructure: SwiftProtobuf.Message, SwiftProtobuf.Proto3Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf.ProtoNameProviding {
  public var swiftClassName: String {return "Common_BlockDataHashingStructure"}
  public var protoMessageName: String {return "BlockDataHashingStructure"}
  public var protoPackageName: String {return "common"}
  public static let _protobuf_fieldNames: FieldNameMap = [
    1: .same(proto: "width", swift: "width"),
  ]


  ///   width specifies the width of the Merkle tree to use when computing the BlockDataHash
  ///   in order to replicate flat hashing, set this width to MAX_UINT32
  var width: UInt32 = 0

  init() {}

  public mutating func _protoc_generated_decodeField<T: SwiftProtobuf.FieldDecoder>(setter: inout T, protoFieldNumber: Int) throws {
    switch protoFieldNumber {
    case 1: try setter.decodeSingularField(fieldType: SwiftProtobuf.ProtobufUInt32.self, value: &width)
    default: break
    }
  }

  public func _protoc_generated_traverse(visitor: SwiftProtobuf.Visitor) throws {
    if width != 0 {
      try visitor.visitSingularField(fieldType: SwiftProtobuf.ProtobufUInt32.self, value: width, fieldNumber: 1)
    }
  }

  public func _protoc_generated_isEqualTo(other: Common_BlockDataHashingStructure) -> Bool {
    if width != other.width {return false}
    return true
  }
}

///   OrdererAddresses is encoded into the configuration transaction as a configuration item of type Chain
///   with a Key of "OrdererAddresses" and a Value of OrdererAddresses as marshaled protobuf bytes
struct Common_OrdererAddresses: SwiftProtobuf.Message, SwiftProtobuf.Proto3Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf.ProtoNameProviding {
  public var swiftClassName: String {return "Common_OrdererAddresses"}
  public var protoMessageName: String {return "OrdererAddresses"}
  public var protoPackageName: String {return "common"}
  public static let _protobuf_fieldNames: FieldNameMap = [
    1: .same(proto: "addresses", swift: "addresses"),
  ]


  var addresses: [String] = []

  init() {}

  public mutating func _protoc_generated_decodeField<T: SwiftProtobuf.FieldDecoder>(setter: inout T, protoFieldNumber: Int) throws {
    switch protoFieldNumber {
    case 1: try setter.decodeRepeatedField(fieldType: SwiftProtobuf.ProtobufString.self, value: &addresses)
    default: break
    }
  }

  public func _protoc_generated_traverse(visitor: SwiftProtobuf.Visitor) throws {
    if !addresses.isEmpty {
      try visitor.visitRepeatedField(fieldType: SwiftProtobuf.ProtobufString.self, value: addresses, fieldNumber: 1)
    }
  }

  public func _protoc_generated_isEqualTo(other: Common_OrdererAddresses) -> Bool {
    if addresses != other.addresses {return false}
    return true
  }
}