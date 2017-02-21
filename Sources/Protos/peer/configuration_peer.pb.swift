/*
 * DO NOT EDIT.
 *
 * Generated by the protocol buffer compiler.
 * Source: peer/configuration.proto
 *
 */

// 
// Copyright IBM Corp. 2017 All Rights Reserved.
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


///   AnchorPeers simply represents list of anchor peers which is used in ConfigurationItem
struct Protos_AnchorPeers: SwiftProtobuf.Message, SwiftProtobuf.Proto3Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf.ProtoNameProviding {
  public var swiftClassName: String {return "Protos_AnchorPeers"}
  public var protoMessageName: String {return "AnchorPeers"}
  public var protoPackageName: String {return "protos"}
  public static let _protobuf_fieldNames: FieldNameMap = [
    1: .unique(proto: "anchor_peers", json: "anchorPeers", swift: "anchorPeers"),
  ]


  var anchorPeers: [Protos_AnchorPeer] = []

  init() {}

  public mutating func _protoc_generated_decodeField<T: SwiftProtobuf.FieldDecoder>(setter: inout T, protoFieldNumber: Int) throws {
    switch protoFieldNumber {
    case 1: try setter.decodeRepeatedMessageField(fieldType: Protos_AnchorPeer.self, value: &anchorPeers)
    default: break
    }
  }

  public func _protoc_generated_traverse(visitor: SwiftProtobuf.Visitor) throws {
    if !anchorPeers.isEmpty {
      try visitor.visitRepeatedMessageField(value: anchorPeers, fieldNumber: 1)
    }
  }

  public func _protoc_generated_isEqualTo(other: Protos_AnchorPeers) -> Bool {
    if anchorPeers != other.anchorPeers {return false}
    return true
  }
}

///   AnchorPeer message structure which provides information about anchor peer, it includes host name,
///   port number and peer certificate.
struct Protos_AnchorPeer: SwiftProtobuf.Message, SwiftProtobuf.Proto3Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf.ProtoNameProviding {
  public var swiftClassName: String {return "Protos_AnchorPeer"}
  public var protoMessageName: String {return "AnchorPeer"}
  public var protoPackageName: String {return "protos"}
  public static let _protobuf_fieldNames: FieldNameMap = [
    1: .same(proto: "host", swift: "host"),
    2: .same(proto: "port", swift: "port"),
    3: .same(proto: "cert", swift: "cert"),
  ]


  ///   DNS host name of the anchor peer
  var host: String = ""

  ///   The port number
  var port: Int32 = 0

  ///   SSL certificate to be used to maintain mutual TLS
  ///   connection with anchor peer
  var cert: Data = Data()

  init() {}

  public mutating func _protoc_generated_decodeField<T: SwiftProtobuf.FieldDecoder>(setter: inout T, protoFieldNumber: Int) throws {
    switch protoFieldNumber {
    case 1: try setter.decodeSingularField(fieldType: SwiftProtobuf.ProtobufString.self, value: &host)
    case 2: try setter.decodeSingularField(fieldType: SwiftProtobuf.ProtobufInt32.self, value: &port)
    case 3: try setter.decodeSingularField(fieldType: SwiftProtobuf.ProtobufBytes.self, value: &cert)
    default: break
    }
  }

  public func _protoc_generated_traverse(visitor: SwiftProtobuf.Visitor) throws {
    if host != "" {
      try visitor.visitSingularField(fieldType: SwiftProtobuf.ProtobufString.self, value: host, fieldNumber: 1)
    }
    if port != 0 {
      try visitor.visitSingularField(fieldType: SwiftProtobuf.ProtobufInt32.self, value: port, fieldNumber: 2)
    }
    if cert != Data() {
      try visitor.visitSingularField(fieldType: SwiftProtobuf.ProtobufBytes.self, value: cert, fieldNumber: 3)
    }
  }

  public func _protoc_generated_isEqualTo(other: Protos_AnchorPeer) -> Bool {
    if host != other.host {return false}
    if port != other.port {return false}
    if cert != other.cert {return false}
    return true
  }
}
